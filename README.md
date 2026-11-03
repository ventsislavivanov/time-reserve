# Time Reserve

A booking management system for a **beauty salon**: clients discover services and specialists, book appointments, and leave reviews; workers and admins manage the schedule through a staff portal.

This repository contains:

| Folder               | What it is                                              |
|:---------------------|:--------------------------------------------------------|
| `front-end-react/`   | **React SPA – the project submitted for the exam**      |
| `back-end/`          | Laravel REST API (Sanctum auth, PostgreSQL)             |
| `front-end-angular/` | Alternative Angular client (see the note at the bottom) |

## 🚀 Live Demo

| Part            | Link                                                                                     |
|:----------------|:-----------------------------------------------------------------------------------------|
| **React app**   | **[https://time-reserve.vercel.app](https://time-reserve.vercel.app)**                   |
| **Laravel API** | **[https://back-end-wild-shape-9497.fly.dev](https://back-end-wild-shape-9497.fly.dev)** |
| API docs        | [https://back-end-wild-shape-9497.fly.dev/api/documentation](https://back-end-wild-shape-9497.fly.dev/api/documentation) |

> [!IMPORTANT]
> **Cold start:** the API runs on a Fly.io free-tier machine that **stops when idle**. The first request after a pause can take 10–30 seconds. If the app seems stuck on first load, wait a moment and refresh.

> [!NOTE]
> **Registration emails:** account activation by email is currently **not guaranteed to work**. Please use the demo accounts below to explore the app.

### Demo accounts

| Role       | Email              | Password   | Login route    |
|:-----------|:-------------------|:-----------|:---------------|
| **Admin**  | admin@test.com     | `password` | `/staff/login` |
| **Worker** | an@test.com        | `password` | `/staff/login` |
| **Client** | john@example.com   | `password` | `/login`       |
| **Guest**  | no login required  | –          | public pages   |

---

## ⚙️ How to Run the React App Locally

Requirements: Node.js 20+ and npm. To log in locally you also need the Laravel API running locally (see the next section), because the deployed API requires reCAPTCHA. To simply try the app, use the live demo above.

```bash
git clone https://github.com/ventsislavivanov/time-reserve.git
cd time-reserve/front-end-react
npm install
cp .env.example .env      # then edit the value below
npm run dev               # http://localhost:5173
```

`front-end-react/.env`:

```env
VITE_API_URL=http://127.0.0.1:8989/api
```

> **reCAPTCHA:** login and registration are protected by reCAPTCHA v3 in production only (`VITE_RECAPTCHA_SITE_KEY` is set on Vercel). **No key is needed locally.** The backend skips the check when `APP_ENV=local`.

Other commands: `npm run build` (production build), `npm run preview`, `npm run lint`.

### Running the backend locally (optional)

Requirements: PHP 8.2+ with `pdo_pgsql`, Composer, and a PostgreSQL database.

```bash
cd time-reserve/back-end
composer install
cp .env.example .env      # set APP_ENV=local and the DB_* credentials
php artisan key:generate
php artisan migrate
php artisan serve --host=127.0.0.1 --port=8989
```

Then set `VITE_API_URL=http://127.0.0.1:8989/api` in the React `.env`.

---

# Functional Guide

## 1. Project Overview

**Application Name:** Time Reserve

**Category:** Booking System (beauty salon appointments)

**Main Purpose:** Time Reserve connects a salon with its clients. Visitors browse services and specialists, registered clients book a time slot with a chosen specialist and follow the appointment through its lifecycle, and can review services. Staff (workers and admins) confirm, run and manage appointments and administer the salon's data (services, categories, job positions, users).

## 2. User Access & Permissions

### Guest (not authenticated)
- **Pages:** `/` (home), `/services`, `/services/:serviceId`, `/our-team`, `/our-team/:workerId`, `/about-us`, `/contact-us`, `/login`, `/sign-up`, `/staff/login`.
- **Public data:** services catalog with categories, service details with reviews and average rating, team members with their services.
- A guest cannot book an appointment or write a review.

### Authenticated user
- **Client**
  - Sections: `/my-appointments`, booking wizard `/our-team/book/:workerId`.
  - Details: service and team member details, appointment details modal with timeline.
  - Create / Edit / Delete: creates appointments and cancels them; creates, edits and deletes **their own reviews**.
- **Worker** (`/staff/*`): dashboard, own appointments, pending requests (confirm / decline), history; start, complete, decline and no-show actions.
- **Admin** (`/staff/*`): dashboard, all appointments, and full CRUD for users, job positions, categories and services.

## 3. Authentication & Session Handling

### Authentication flow
1. **App load:** `App.jsx` shows a full-screen loader and checks `localStorage` for a token.
2. **Status check:** if a token exists, `GET /me` is called. On success the user is stored in the Auth Context; on failure the token is removed.
3. **Register / Login:** the form (with reCAPTCHA v3) calls the API, which returns a token and the user. The token is saved in `localStorage`, the user is saved in the Auth Context, and the user is redirected by role (client → `/`, staff → `/staff/dashboard`).
4. **Logout:** `POST /logout` revokes the token, `localStorage` is cleared, the Auth Context is reset, and the user is redirected.

### Session persistence
The token lives in `localStorage` and is attached to every request by an Axios interceptor. The current user lives in **React Context** (`AuthProvider`). After a page refresh the `GET /me` check on startup restores the session automatically. An expired token (401) is removed and the user is treated as a guest.

## 4. Routing Structure

### Route guards logic
- `GuestGuard` – wraps `/login`, `/sign-up` and `/staff/login`; **logged-in users are redirected** to their home page.
- `RoleGuard` – wraps private routes and checks the allowed roles. Unauthenticated users are redirected to the login page; users with the wrong role are redirected away.
- `StaffLayout` – blocks the whole `/staff` area for anyone who is not an admin or worker.

### Main routes
- 5 public pages (home, services, team, about, contact) + login / sign-up.
- 2 client pages (`/my-appointments`, booking wizard).
- ~10 staff pages for the worker and admin roles.

### Nested & parameterized routes
- **Nested:** `ClientLayout` and `StaffLayout` are layout routes with child routes (via `<Outlet />`); guards are layout routes as well.
- **URL parameters:**
  - `/services/:serviceId` – service details
  - `/our-team/:workerId` – team member details
  - `/our-team/book/:workerId` – booking wizard

## 5. List → Details Flow

### Catalog / List pages
- **`/services`** – cards with name, category, description, duration and price; **filter by category**.
- **`/our-team`** – cards with the specialist, job position and offered services.
- Loading skeletons, empty-state messages and error messages are shown.

### Details pages
- Navigation uses `<Link>` (`View details`, `View profile`) and `useNavigate` (`Book Appointment`).
- `useParams` provides `serviceId` / `workerId`; hooks fetch the record and handle loading, error and "not found" states.
- The service details page also contains the **reviews** section.

## 6. Data Source & Backend

**Backend type:** real custom REST API – **Laravel** (Sanctum token auth, policies for authorization) with **PostgreSQL** hosted on Supabase. Deployed on **Fly.io**; the React app is deployed on **Vercel**. Data persists between visits. API reference: see the API docs link above.

## 7. Data Operations (CRUD)

The main user-owned collection is **Reviews** (service reviews). Other collections (services, categories, job positions, users, appointments) are managed by staff.

| Operation   | Reviews (author only)                                                                                         |
|:------------|:--------------------------------------------------------------------------------------------------------------|
| **Create**  | A logged-in client submits the form on the service details page → `POST /api/services/{id}/reviews`. One review per client per service. |
| **Read**    | `GET /api/services/{id}/reviews` (public) – list plus average rating and count.                               |
| **Update**  | The author clicks **Edit** on their review → `PUT /api/reviews/{id}`. The list is reloaded afterwards.        |
| **Delete**  | The author clicks **Delete** and confirms → `DELETE /api/reviews/{id}`. The list is reloaded afterwards.      |

**Authorization:** only the author sees Edit / Delete in the UI, **and** the API enforces it with a Laravel policy (anyone else gets `403`). Create is allowed for clients only.

Admins have full CRUD over services, categories, job positions and users; clients create and cancel appointments; workers move appointments through their statuses.

## 8. Forms & Validation

### Forms used
Login, Sign-up, Review (create / edit), Booking wizard (service, date, time slot, notes), and admin forms for categories, services, job positions and users, plus filter forms.

Forms use **react-hook-form** wrapped in reusable controlled UI components (`UIInput`, `UISelect`, `UITextarea`, `UIDatePicker` via `Controller`). Filters, search inputs and booking notes are plain controlled inputs (`value` + `onChange` synthetic events). Server-side validation errors (422) are mapped back to the matching fields.

### Validation rules
- **Sign-up – full name:** required; two names separated by a space, letters only, each starting with a capital letter.
- **Sign-up – password:** required; 6–10 characters; letters and numbers only. Confirm password must match.
- **Review – comment:** required; 3–1000 characters; cannot be only whitespace. **Rating:** required, 1–5.
- Also: email format, phone format, required address, birth date and gender, service price and duration limits.

## 9. React-Specific Techniques

### Hooks & component lifecycle
- `useState`, `useEffect`, `useMemo`, `useCallback`, `useRef`, `useParams`, `useNavigate`, `useLocation`, `useSearchParams`, plus many custom hooks (`useReviews`, `useWorker`, `useServiceDetails`, `useServicesCatalog`, `useAppForm`, `useEntityManager`, …).
- **Mount / update / unmount example:** `useWorker` fetches the team member **on mount**, **re-fetches when `workerId` changes**, and its cleanup function **ignores the result after unmount**, preventing state updates on an unmounted component. `RowActions` registers a document listener on mount and removes it on unmount.

### Context API
`AuthContext` (`src/context`) holds the current user and `isAuthenticated`, and exposes `login` and `logout`. It is consumed through the `useAuth()` hook by `App`, the layouts, both guards, the login form and the reviews section.

### Component styling
Bootstrap 5 (Bootswatch *Spacelab* theme) for layout and components, plus **external CSS Modules** (`*.module.css`) for skeletons, toast, header, datepicker and row actions. Icons come from Font Awesome.

### Project structure
```
front-end-react/src
├── components/   reusable UI (base, controlled, display, complex) and layout
├── context/      AuthContext + useAuth
├── features/     auth, services, workers, reviews, appointments, categories, jobs, users, dashboard
│                 (each with components, hooks, services, validations)
├── hooks/        shared hooks
├── layouts/      ClientLayout, StaffLayout
├── services/     Axios instance with interceptors, notifications
└── utils/        validators, icons
```

## 10. Typical User Flow

1. A guest opens **Services**, filters by category and opens a service to read its details and reviews.
2. The guest opens **Our team**, views a specialist, and is asked to log in when trying to book.
3. After logging in, the client picks a specialist, a service, a date and a free time slot, and confirms the booking.
4. The worker sees the request under **Pending** and confirms it; the client follows the status in **My appointments** and can cancel.
5. After the visit the client opens the service page and leaves a review, which they can later edit or delete.

## 11. Error & Edge Case Handling

- **Authentication errors:** invalid credentials and expired sessions show a toast; a 401 removes the token. Form errors from the API are displayed under the fields. Logged-in users cannot open the login / sign-up pages, and guests are redirected away from private pages.
- **Network or data errors:** an Axios interceptor shows toast messages (including *"No connection to server"*); pages show loading spinners / skeletons and inline error alerts.
- **Empty or missing data:** friendly empty states ("No services available", "No reviews yet"), and *not found* messages for unknown service or team member ids.

---

## Appendix: Angular client

The repository also contains an alternative Angular 21 client in `front-end-angular/`, using the same API (live demo: [time-reserve-ybzm.vercel.app](https://time-reserve-ybzm.vercel.app)). It is **not** part of the exam submission. Its admin area only demonstrates CRUD for categories; the full administration is available in the React app. To run it: `cd front-end-angular && npm install && ng serve` (http://localhost:4200).
