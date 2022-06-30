FROM public.ecr.aws/docker/library/alpine:3.15.3
COPY . app
COPY package*.json app/
WORKDIR app/
RUN apk update
RUN apk add nodejs npm
RUN npm i
CMD ["node", "server.js"]
