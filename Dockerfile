FROM nginx:latest

RUN mkdir /app
COPY _book/ /app

COPY nginx.conf /etc/nginx/nginx.conf
