# FROM node:16-alpine
# RUN apk-get update
# RUN npm install -g firebase-tools
# FROM node:10-buster
# RUN apt-get update -y
# RUN apt-get install -y curl openjdk-11-jre-headless
# RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
#     && apt-get install -y nodejs
# RUN npm install -g firebase-tools

# FROM node:10-buster

# RUN apt-get update -y

# RUN apt-get install -y curl openjdk-11-jre-headless

# RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
#     && apt-get install -y nodejs

# RUN npm install -g firebase-tools

# FROM node:lts-alpine
# RUN apk add --no-cache openjdk11-jre-headless
FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install curl openjdk-11-jre-headless
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - \
    && apt-get install nodejs
RUN npm install -g firebase-tools