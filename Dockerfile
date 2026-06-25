#FROM docker.io/node:22
FROM quay.io/konflux-ci/yarn4-nodejs22-ubi9-minimal:latest@sha256:de1529d9d01072cb4e6684543ac24c6b359f758ebc0f3c7e449b5978e5b4668e

WORKDIR /app

COPY --chown=1001:1001 package.json ./
COPY --chown=1001:1001 yarn.lock ./

RUN yarn install

COPY app.js ./

EXPOSE 3000

CMD ["yarn", "start"]
