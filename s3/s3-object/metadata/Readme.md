# Create bucket
```sh
aws s3 mb s3://metadata-exe-tc1
```

# Create file

echo "Hello" > hello.txt

# Upload file with metadata
```sh
aws s3api put-object --bucket="metadata-exe-tc1" --key hello.txt --body hello.txt --metadata PLanet=WORLD
```

# Get  metadata
```sh
aws s3api head-object --bucket metadata-exe-tc1 --key hello.txt
```
