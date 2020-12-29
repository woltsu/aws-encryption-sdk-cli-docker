#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export $(grep -v '^#' $DIR/.env | xargs)

cat $1 | docker run -i --rm --env-file $DIR/.env aws-encryption-sdk-cli:latest --decrypt -i - --wrapping-keys key=$KEY_ARN --decode -S --output -  > $2