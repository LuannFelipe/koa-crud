FROM node:16-alpine3.14

#RUN chown -R node:node /app

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

#COPY --chown=node:node . .

#USER node

EXPOSE 3000

CMD [ "next", "dev"]