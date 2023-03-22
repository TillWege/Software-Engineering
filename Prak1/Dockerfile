# syntax=docker/dockerfile:1
   
FROM node:current-alpine3.17
COPY . .
WORKDIR /app
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000