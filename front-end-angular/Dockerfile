# Stage 1: Compilation
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --legacy-peer-deps
COPY . .
RUN npm run build --configuration=production

# Stage 2: Serving with Nginx
FROM nginx:1.25-alpine

COPY --from=build /app/dist/front-end-angular/browser /usr/share/nginx/html
RUN echo 'server { listen 80; location / { root /usr/share/nginx/html; index index.html; try_files $uri $uri/ /index.html; } }' > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
