FROM node:20.11-alpine AS base

WORKDIR /app

COPY package*.json ./

FROM base as dev

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]

FROM base as production

RUN npm install --omit=dev

COPY . .

RUN npm run build

EXPOSE 3000

CMD [ "npm", "start" ]






