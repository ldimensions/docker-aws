FROM node:alpine as BUILD

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build --prod

FROM nginx
EXPOSE 80
COPY --from=BUILD /usr/src/app/dist/docker-testing-one /usr/share/nginx/html


# commands

# docker run -p 80:80 <docker-image>

