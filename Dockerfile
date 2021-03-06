# Build phase
FROM node:alpine

WORKDIR '/app'

COPY package.json .

RUN yarn install

COPY . .

RUN yarn build

# RUN phase

FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html


