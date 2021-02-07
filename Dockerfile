## Build React App ##

FROM node:14.15.4-buster as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

RUN npm install react-scripts -g

COPY . .

RUN npm run build

## Run w/ Nginx ##
FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
