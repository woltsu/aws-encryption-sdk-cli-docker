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

## Encrypting files
1. Build the image:
```bash
./build.sh
```

2. Encrypt:
```bash
cat input_path | ./encrypt.sh > output_path
```

>```bash
> cat secret.txt | ./encrypt.sh > secret.txt.encrypted
>```

3. Decrypt:
```bash
cat input_path | ./decrypt.sh > output_path
```
>```bash
> cat secret.txt.encrypted | ./decrypt.sh > secret.txt
>```