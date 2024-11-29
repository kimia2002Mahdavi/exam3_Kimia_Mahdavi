# مرحله ۱: ساخت مرحله‌ای (Build Stage)
FROM node:16 AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# مرحله ۲: مرحله تولید (Production Stage)
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
