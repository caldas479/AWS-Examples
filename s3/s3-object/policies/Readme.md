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