#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
env_path=$DIR/.env

while getopts "e:" arg; do
  case $arg in
    e) env_path=$OPTARG;;
  esac
done

export $(grep -v '^#' $env_path | xargs)

docker run -i --rm --env-file $env_path aws-encryption-sdk-cli:latest --decrypt -i - --wrapping-keys key=$KEY_ARN --decode -S --output -