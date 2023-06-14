# Build docker image.
FROM node:12 as node

WORKDIR /app

COPY ./ /app/

RUN npm install

RUN npm run build

# use nginx
FROM nginx:1.12
COPY --from=node /app/build/ /var/www/dist/

# Copy nginx file
COPY --from=node /app/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]