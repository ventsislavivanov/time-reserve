# Stage 1: Base & Dependencies
FROM node:20-alpine AS base
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

# Stage 2: Development (За локално пускане с Hot Reload)
FROM node:20-alpine AS development
WORKDIR /app
COPY --from=base /app/node_modules /tmp/node_modules
COPY . .

EXPOSE 80

# Копираме съдържанието на /tmp/node_modules/ вътре в /app/node_modules/ при ВСЯКО стартиране
CMD ["sh", "-c", "mkdir -p /app/node_modules && cp -a /tmp/node_modules/. /app/node_modules/ && npm run dev -- --host 0.0.0.0 --port 80"]

# Stage 3: Production Build
FROM base AS build
RUN npm run build

# Stage 4: Serving with Nginx
FROM nginx:1.25-alpine AS production
COPY --from=build /app/dist /usr/share/nginx/html
RUN echo 'server { listen 80; location / { root /usr/share/nginx/html; index index.html; try_files $uri $uri/ /index.html; } }' > /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]