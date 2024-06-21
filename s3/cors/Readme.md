# CORS
Cross-origin resource sharing (CORS) defines a way for client web applications that are loaded in one domain to interact with resources in a different domain. With CORS support, you can build rich client-side web applications with Amazon S3 and selectively allow cross-origin access to your Amazon S3 resources.

## Create a bucket

```sh
aws s3api create-bucket --bucket cors-exe-tc123 --region us-east-1
```

## Change block public access
```sh
aws s3api put-public-access-block --bucket cors-exe-tc123 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create bucket policy
```sh
aws s3api put-bucket-policy --bucket cors-exe-tc123 --policy file://bucket-policy.json
```

## Turn on static website
```sh
aws s3api put-bucket-website --bucket cors-exe-tc123 --website-configuration file://website.json
```

## Upload indext.html to bucket 
```sh
aws s3 cp index.html s3://cors-exe-tc123
```

## View the website 
http://cors-exe-tc123.s3-website-us-east-1.amazonaws.com