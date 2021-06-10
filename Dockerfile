FROM postman/newman:latest
LABEL maintainer="Faizul Islam <faizulcse@gmail.com>"

WORKDIR /etc/newman
COPY package*.json .
USER root
RUN npm install --force
COPY . .