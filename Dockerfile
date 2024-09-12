# STAGE 1: Build an App #
FROM node:20-alpine AS build-source
LABEL autodelete="true"
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 5173
CMD [ "npm", "run", "dev" ]