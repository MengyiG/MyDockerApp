# start by basing it on another image
# node is pre-installed because of base image
FROM node:13-alpine

# set environment variables, optional
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# create a directory inside the container
RUN mkdir -p /home/app

# executes on the host machine: 
# source is ./app and target is /home/app
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
# CMD is the entrypoint command
CMD ["node", "server.js"]

