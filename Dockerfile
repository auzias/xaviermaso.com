FROM node:6

# TODO: remove once https://github.com/docker-library/buildpack-deps/issues/55 is resolved
RUN apt-get update && apt-get install apt-transport-https

# TODO: install yarn manually until https://github.com/nodejs/docker-node/issues/243 is implemented
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV

COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/

RUN yarn install
COPY . /usr/src/app

RUN npm run build

EXPOSE 8000

USER node

CMD ["npm", "start"]
