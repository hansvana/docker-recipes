FROM node:latest

WORKDIR /var/www
ADD package.json /var/www/package.json
ADD server.js /var/www/server.js

RUN npm install nodemon -global
RUN npm install

EXPOSE 12345

CMD ["nodemon", "-L", "/var/www/server.js"]
