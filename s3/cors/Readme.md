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

## Upload js file to bucket 
```sh
aws s3 cp hello.js s3://cors-exe-tc123
```

## Create API Gateway with mock response and then test the endpoint
```sh
curl -X POST -H "Content-Type: application/json" https://ig1z0e5nn2.execute-api.eu-west-1.amazonaws.com/prod/hello
```

## View the website and check for the cors error
http://cors-exe-tc123.s3-website-us-east-1.amazonaws.com

## Set cors on bucket
```sh
aws s3api put-bucket-cors --bucket cors-exe-tc123 --cors-configuration file://cors-configuration.json
```

## View the website and check error no longer exists
http://cors-exe-tc123.s3-website-us-east-1.amazonaws.com