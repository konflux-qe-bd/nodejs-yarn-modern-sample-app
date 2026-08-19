#FROM docker.io/node:22
FROM quay.io/konflux-ci/yarn4-nodejs22-ubi9-minimal:latest@sha256:1dbcf45fb74c167d6d312096b937f96144ef0eef1a30b63c0f67b0ae51d89951

WORKDIR /app

COPY --chown=1001:1001 package.json ./
COPY --chown=1001:1001 yarn.lock ./

RUN yarn install

COPY app.js ./

EXPOSE 3000

CMD ["yarn", "start"]
