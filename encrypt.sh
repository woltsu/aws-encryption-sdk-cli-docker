#!/bin/bash
export $(grep -v '^#' .env | xargs)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cat $1 | docker run -i --rm --env-file $DIR/.env aws-encryption-sdk-cli:latest --encrypt -i - --wrapping-keys key=$KEY_ARN --encode -S --output - > $2
