# aws-encryption-sdk-cli-docker
Docker image for aws-encryption-sdk-cli

## Setup
1. Create `.env` file to the project folder
2. Create a symmetric KMS key in AWS console
    1. Copy the key arn into `.env` as `KEY_ARN`
3. Create an IAM user with programmatic access
    1. Copy access key id and secret access key to `.env` as `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
4. Create a new IAM policy: 
    1. Required KSM create actions: `Decrypt`, `Encrypt` and `GenerateDataKey`
    2. From the `Resources` tab, select `Specific` and add the created KMS key's arn there
5. Attach the created policy to the created user

## Usage
1. Build the image:
```bash
./build.sh
```

2. Encrypt:
```bash
./encrypt.sh <input path> <output path>
```

>```bash
>./encrypt.sh secret.txt secret.txt.encrypted
>```

3. Decrypt:
```bash
./decrypt.sh <input path> <output path>
```
>```bash
>./decrypt.sh secret.txt.encrypted secret.txt
>```