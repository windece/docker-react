FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

#RUN npm install -g react-scripts
#RUN npm i react-native-scripts --save

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html



