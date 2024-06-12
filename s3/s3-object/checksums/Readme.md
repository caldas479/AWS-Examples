
# Get checksum
```md
md5sum myfile.txt

0084467710d2fc9d8a306e14efbe6d0f  myfile.txt
```

# Upload file
```md
aws s3 cp myfile.txt s3://checksum-exe-tc1
aws s3api head-object --bucket checksum-exe-tc1 --key myfile.txt

 "ETag": "\"0084467710d2fc9d8a306e14efbe6d0f\"", matches checksum!
```


# Upload with checksum algorithm

## Get checksum
```md
bundle exec ruby crc.rb
```

```sh
aws s3api put-object \
--bucket checksum-exe-tc1 \
--key myfilesha1.txt \
--body myfile.txt \
--checksum-algorithm="SHA1" \
--checksum-sha1="a8eec30a5b2d71bc890175f5b361ebb28d7c54a8"
```