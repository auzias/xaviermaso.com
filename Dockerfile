FROM node:6

RUN apt-get update && apt-get install apt-transport-https

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

CMD ["npm", "start"]
