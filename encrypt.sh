#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export $(grep -v '^#' $DIR/.env | xargs)

docker run -i --rm --env-file $DIR/.env aws-encryption-sdk-cli:latest --encrypt -i - --wrapping-keys key=$KEY_ARN --encode -S --output -
