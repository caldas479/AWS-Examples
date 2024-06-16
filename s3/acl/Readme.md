# ACLs
Amazon S3 access control lists (ACLs) enable you to manage access to buckets and objects. Each bucket and object has an ACL attached to it as a subresource. It defines which AWS accounts or groups are granted access and the type of access. When a request is received against a resource, Amazon S3 checks the corresponding ACL to verify that the requester has the necessary access permissions.

# Create a bucket
```sh
aws s3api create-bucket --bucket acl-exe-tc123 --region us-east-1
```
When you create a bucket or an object, Amazon S3 creates a default ACL that grants the resource owner full control over the resource

# Turn of Block Public Access for ACLs
```sh
aws s3api put-public-access-block \
    --bucket acl-exe-tc123 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"

```

# Change Bucket Ownership
```sh
aws s3api put-bucket-ownership-controls \
    --bucket acl-exe-tc123 \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerEnforced}]"

```