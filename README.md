### 🚀 Live Demo
The application is deployed and can be tested live at:


| Framework       | Live Demo Link                                                                                                               | 
|:----------------|:-----------------------------------------------------------------------------------------------------------------------------|
| **Angular**     | **[https://time-reserve-ybzm.vercel.app](https://time-reserve-ybzm.vercel.app)**                                             |
| **React**       | **[https://time-reserve.vercel.app](https://time-reserve.vercel.app)**                                                       |
| **Laravel API** | **[https://back-end-wild-shape-9497.fly.dev/api/documentation](https://back-end-wild-shape-9497.fly.dev/api/documentation)** |



### 1. Application Purpose

The Goal:
Time Reserve is a versatile booking management system designed to streamline the appointment process between businesses and clients. While the core engine is adaptable to various industries (such as healthcare or automotive services), this implementation is specifically tailored for a Beauty Salon. It provides a seamless bridge between discovering services, selecting professionals, and managing personal schedules.
### 2. User Roles & Access Control


    Guest (Unauthenticated): Can browse services and team profiles but is restricted from booking until authenticated.

    Client (Authenticated): Can manage personal bookings and schedule new appointments.

    Worker: Access to a staff portal to manage pending requests and work history.

    Admin: In the Angular version, the Admin role is specifically authorized to perform CRUD operations on the system's categories.

### 3. Features & Access

To explore the different functionalities of the application, you can use the following pre-configured accounts:

| Role        | Email               | Password | Login route    | Accessible Pages                                                                |
|:------------|:--------------------|:---------|:---------------|:--------------------------------------------------------------------------------|
| **Admin**   | admin@test.com      | password | `/staff/login` | `Dashboard`, `Appointnemt`, `User`,  `Job`, `Categories`, `Services`, `Reports` |
| **Worker**  | an@test.com         | passowrd | `/staff/login` | `Dashboard`, `Appointnemt`, `Pending`, `History`                                |
| **Client**  | john@example.com    | password | `/login`       | `My Appointments`, `Book Appointment`                                           |
| **Guest**   | `No Login Required` | `None`   | `public`       | `Home`, `About`, `Services`, `Our team`, `Contact`                              |

> [!IMPORTANT]
> **Email Verification Required:** The system uses a real email service for account activation. If you choose to register a new account instead of using the demo credentials, please **use a valid email address** to receive and click the confirmation link.

> [!NOTE]
> **Angular Version Scope:** In this version, the Administrative section is specifically designed to demonstrate **CRUD (Create, Read, Update, Delete) functionality** for categories. Full administrative management of the entire system is available in the React implementation.



### 4. Main Application & Appointment Lifecycle

The core of **Time Reserve** is its dynamic appointment management system. The process involves a coordinated workflow between the **Client** and the **Worker**:

#### **Phase 1: Booking & Confirmation**
*  **Reservation:** An authenticated **Client** selects a professional, a date, and a specific time slot to create a booking request.
*  **Worker Review:** The appointment appears in page **Pending**.
*  **Decision:** * The **Worker** can **Confirm** the appointment, moving it to the upcoming schedule.
    * Alternatively, the **Worker** can **Decline** the request if the slot is unavailable.
*  **Client Cancellation:** At any point before the appointment starts, the **Client** has the right to **Cancel** the reservation from their profile.

#### **Phase 2: Execution & Management**
* **Approved Appointments:** Once a request is confirmed, it moves to the **Appointments** page in the Staff portal.
* **Service Control:** From the Appointments page, the **Worker** has two main options:
    * **Start:** Transition the appointment to an **In Progress** state when the client arrives.
    * **Decline:** If a conflict arises after approval, the worker can still decline the appointment (requires a mandatory comment).
* **Completion:** Once a service is started, the worker can finalize the process by clicking the **Complete** button, marking the appointment as successfully finished.

### 5. Technologies Used
* **Frontend:** Angular (21), TypeScript
* **Backend Integration:** REST API
* **Deployment FE:** Vercel
* **Deployment BE:** Fly.io

---

### 6. API Reference & Data Models
For a detailed look at the data structures, endpoints, and models used in this project, please refer to the official API documentation:
🔗 **[Link to API Documentation]** *(https://back-end-wild-shape-9497.fly.dev/api/documentation)*

### 7. How to Run the Project Locally
To run the project locally, follow these steps:
1. Clone the repository: `git clone https://github.com/ventsislavivanov/time-reserve.git`
2. Navigate to the project directory: `cd time-reserve/back-end`
3. Install dependencies: `composer setup`
4. Copy the `.env.example` file to `.env` and update the database credentials:
   * DB_CONNECTION=pgsql
   * DB_HOST=db.lkyklocykxwqoglqetzb.supabase.co
   * DB_PORT=5432
   * DB_DATABASE=postgres
   * DB_USERNAME=postgres
   * DB_PASSWORD=YOUR_PASSWORD_HERE
5. Run php artisan serve --host=127.0.0.1 --port=8989   
6. Navigate to the project directory: `cd time-reserve/front-end-angular`
7. Install dependencies: `npm install`
8. Start the development server: `ng serve`
9. Access the application at: `http://localhost:4200`
