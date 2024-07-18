# Temporary security credentials in IAM
You can use the AWS Security Token Service (AWS STS) to create and provide trusted users with temporary security credentials that can control access to your AWS resources. Temporary security credentials work almost identically to long-term access key credentials, with some differences.

## Create a user with no permissions
Create user and generate access keys

```sh
aws iam create-user --user-name sts-Bob
aws iam create-access-key --user-name sts-Bob --output table
```

Copy the access key and secret
```sh
aws configure
```

Change default to sts
```sh
open ~/.aws/credentials
```

Test who you are
```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile sts
```

Test you don't have permissions
```sh
aws s3 ls --profile sts
aws s3 ls s3://sts-exe-tc123 --profile sts
```
> An error occurred (AccessDenied) when calling the ListBuckets operation: Access Denied

## Create a role
Create a role that will access a new resource

```sh
chmod u+x bin/deploy
./bin/deploy
```

## Use new user credentials and assume role

Attach the policy to the user
```sh
aws iam put-user-policy \
    --user-name sts-Bob \
    --policy-name StsAssumePolicy \
    --policy-document file://policy.json
```

Assume role
```sh
aws sts assume-role \
    --role-arn arn:aws:iam::992382461243:role/sts-stack-exe-tc123-StsRole-3KfW1OhlsxQZ \
    --role-session-name s3-sts-example \
    --profile sts
```

Create assumed profile and copy credentials
```sh
open ~/.aws/credentials
```

Test who you are
```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile assumed
```

Test you have permissions
```sh
aws s3 ls --profile assumed
aws s3 ls s3://sts-exe-tc123 --profile assumed
```

## Destroy

Tear down stack and delete user
```sh
aws iam delete-user-policy --user-name sts-Bob --policy-name StsAssumePolicy
aws iam delete-access-key --user-name sts-Bob --access-key-id AKIA6ODU2UU5TPERR46T
aws iam delete-user --user-name sts-Bob
```