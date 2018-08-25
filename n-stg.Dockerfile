FROM node:alpine as builder

COPY package.json ./

## Storing node modules on a separate layer will prevent unnecessary npm installs at each build
RUN npm i && mkdir /app && mv ./node_modules ./app

WORKDIR /app

COPY . .

RUN npm run sy-build

# Stage 2, based on Nginx, to have only the compiled app, ready for production with Nginx

FROM nginx:alpine

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## From ‘builder’ stage copy over the artifacts in dist folder to default nginx public folder
COPY --from=builder /app/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
