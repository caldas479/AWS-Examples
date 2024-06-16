# Policies
With Amazon S3 bucket policies, you can secure access to objects in your buckets, so that only users with the appropriate permissions can access them. You can even prevent authenticated users without the appropriate permissions from accessing your Amazon S3 resources.

# Create a bucket
```sh
aws s3api create-bucket --bucket pol-exe-tc123 --region us-east-1
```

# Preventing users from deleting
In the following policy example, you explicitly deny DELETE Object permissions to the user Dave. An explicit deny always supersedes any other permission granted.
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "statement1",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:user/Dave"
      },
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetBucketAcl"
      ],
      "Resource": [
        "arn:aws:s3:::pol-exe-tc123",
	 	"arn:aws:s3:::pol-exe-tc123/*"
      ]
    },
    {
      "Sid": "statement2",
      "Effect": "Deny",
      "Principal": {
        "AWS": "arn:aws:iam::123456789012:user/Dave"
      },
      "Action": [
        "s3:DeleteObject",
        "s3:DeleteObjectVersion",
        "s3:PutLifecycleConfiguration"
      ],
      "Resource": [
        "arn:aws:s3:::pol-exe-tc123",
	    "arn:aws:s3:::pol-exe-tc123/*"
      ]
    }
  ]
}
```

# Apply the policy
```sh
aws s3api put-bucket-policy --bucket pol-exe-tc123 --policy file://bucket-policy.json
```

# S3 bucket policy vs IAM policy
https://aws.amazon.com/blogs/security/iam-policies-and-bucket-policies-and-acls-oh-my-controlling-access-to-s3-resources/

## Use IAM Policies if:
- You need to control access to multiple AWS services, not just S3.
- You have many S3 buckets with different permission requirements.
- You prefer managing permissions centrally in IAM.

## Use S3 Bucket Policies if:
- You want to easily grant cross-account access without using IAM roles.
- Your IAM policies are hitting size limits (2 KB for users, 5 KB for groups, 10 KB for roles), as S3 bucket policies support up to 20 KB.
- You prefer managing permissions within the S3 environment.
- You need to apply security controls like IP or VPC restrictions directly to the S3 bucket.

## Considerations:
- Use IAM policies to answer “What can this user do in AWS?”
- Use S3 bucket policies to answer “Who can access this S3 bucket?”

**Recommendation:** Stay as consistent as possible to simplify auditing permissions.