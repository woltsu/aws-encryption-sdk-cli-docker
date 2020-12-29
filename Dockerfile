FROM alpine:latest

RUN apk add --no-cache --update python3 openssl-dev

RUN apk add --no-cache --update --virtual .build-deps \
  python3-dev \
  gcc \
  musl-dev \
  libffi-dev \
  py3-pip \
  && pip3 install --no-cache-dir aws-encryption-sdk-cli

ENTRYPOINT ["aws-encryption-cli"]