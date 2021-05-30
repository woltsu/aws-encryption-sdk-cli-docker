FROM alpine:latest

RUN apk add --no-cache --update python3 openssl-dev

RUN apk add --no-cache --update --virtual .build-deps \
  python3-dev \
  gcc \
  musl-dev \
  libffi-dev \
  py3-pip \
  cargo \
  && pip3 install --upgrade --no-cache-dir cryptography==3.3.2 aws-encryption-sdk-cli

ENTRYPOINT ["aws-encryption-cli"]