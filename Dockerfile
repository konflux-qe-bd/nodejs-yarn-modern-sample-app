#FROM docker.io/node:22
FROM quay.io/konflux-ci/yarn4-nodejs22-ubi9-minimal:latest@sha256:eb64fec3b89d6c0864e4cc4d972010bfcddcb2a9d00257a69974b6d349043c8f

WORKDIR /app

COPY --chown=1001:1001 package.json ./
COPY --chown=1001:1001 yarn.lock ./

RUN yarn install

COPY app.js ./

EXPOSE 3000

CMD ["yarn", "start"]
