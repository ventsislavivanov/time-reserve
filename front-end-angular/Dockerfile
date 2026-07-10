# Stage 1: Base & Dependencies
FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm ci --legacy-peer-deps
COPY . .

# New Stage: Development (За локално пускане с Hot Reload)
FROM base AS development
EXPOSE 80
CMD ["npx", "ng", "serve", "--host", "0.0.0.0", "--port", "80"]

# Stage 2: Production Build
FROM base AS build
RUN npm run build --configuration=production

# Stage 3: Serving with Nginx
FROM nginx:1.25-alpine AS production
COPY --from=build /app/dist/front-end-angular/browser /usr/share/nginx/html
RUN echo 'server { listen 80; location / { root /usr/share/nginx/html; index index.html; try_files $uri $uri/ /index.html; } }' > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
