FROM postman/newman:latest
LABEL maintainer="Faizul Islam <faizulcse@gmail.com>"

WORKDIR /app
COPY package*.json ./
USER root
RUN npm install
COPY . .