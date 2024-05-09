FROM node:22-alpine3.18

# Copy package.json only to temp folder, install its dependencies,
# set workdir and copy the dependnecies there
RUN mkdir /src

# install root dependencies
COPY package.json /tmp/
RUN cd /tmp && npm install --silent
RUN cp -a /tmp/node_modules /src/

COPY [".", "/src"]
WORKDIR /src

ENV PORT=3001

ARG REACT_APP_BACKEND_URL

# Set the environment variable using the ARG value
ENV REACT_APP_BACKEND_URL=${REACT_APP_BACKEND_URL}

RUN npm run build

CMD npm run start

EXPOSE 3001
