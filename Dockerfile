#FROM docker.io/node:22
FROM quay.io/konflux-ci/yarn4-nodejs22-ubi9-minimal:latest@sha256:098bd86e0f5466cf6018e6546d9a7a7589d7a7a10e477b0ad31990cee8f368ba

WORKDIR /app

COPY --chown=1001:1001 package.json ./
COPY --chown=1001:1001 yarn.lock ./

RUN yarn install

COPY app.js ./

EXPOSE 3000

CMD ["yarn", "start"]
