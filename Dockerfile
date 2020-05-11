FROM node:11-alpine AS builder
COPY . ./angular8
WORKDIR /angular8
RUN npm install
RUN npm run build:prod:en

FROM nginx:1-alpine
COPY --from=builder /angular8/dist/browser/ /usr/share/nginx/html
EXPOSE 80
