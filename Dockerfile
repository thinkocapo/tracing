# any recent version gives warning, "npm WARN deprecated fsevents@1.1.2: Way too old"
FROM node:10.15.3 

# COPY ./react ./app
# COPY ./.git/ ./app/.git/
COPY . ./app

WORKDIR /app/react

EXPOSE 5000

RUN curl -sL https://sentry.io/get-cli/ | bash

ARG AUTH_TOKEN
ENV SENTRY_AUTH_TOKEN=$SENTRY_AUTH_TOKEN

RUN npm install

# RUN REACT_APP_PORT=8080 npm run build && make setup_release
RUN REACT_APP_PORT=8080 npm run build 

WORKDIR /app
RUN REACT_APP_PORT=8080 make setup_release

RUN npm install -g serve

CMD ["serve", "-s", "build"]

# fails
# CMD serve -s build