# Data Protection in Amazon S3

Data protection refers to protecting data while it's in transit (as it travels to and from Amazon S3) and at rest (while it is stored on disks in Amazon S3 data centers). You can protect data in transit by using Secure Socket Layer/Transport Layer Security (SSL/TLS) or client-side encryption. For protecting data at rest in Amazon S3, you have the following options:

## Server-Side Encryption

Amazon S3 encrypts your objects before saving them on disks in AWS data centers and then decrypts the objects when you download them.

All Amazon S3 buckets have encryption configured by default, and all new objects that are uploaded to an S3 bucket are automatically encrypted at rest. Server-side encryption with Amazon S3 managed keys (SSE-S3) is the default encryption configuration for every bucket in Amazon S3. To use a different type of encryption, you can either specify the type of server-side encryption to use in your S3 PUT requests, or you can set the default encryption configuration in the destination bucket.

### Specifying Encryption in S3 PUT Requests

If you want to specify a different encryption type in your PUT requests, you can use:
- **Server-side encryption with AWS Key Management Service (AWS KMS) keys (SSE-KMS)**
- **Dual-layer server-side encryption with AWS KMS keys (DSSE-KMS)**
- **Server-side encryption with customer-provided keys (SSE-C)**

### Setting Default Encryption Configuration in the Destination Bucket

To set a different default encryption configuration in the destination bucket, you can use:
- **Server-side encryption with AWS KMS keys (SSE-KMS)**
- **Dual-layer server-side encryption with AWS KMS keys (DSSE-KMS)**

For more information about each option for server-side encryption, see [Protecting data with server-side encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/serv-side-encryption.html).

To configure server-side encryption, see:
- [Specifying server-side encryption with Amazon S3 managed keys (SSE-S3)](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html)
- [Specifying server-side encryption with AWS KMS (SSE-KMS)](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html)
- [Specifying dual-layer server-side encryption with AWS KMS keys (DSSE-KMS)](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingDSSEncryption.html)
- [Specifying server-side encryption with customer-provided keys (SSE-C)](https://docs.aws.amazon.com/AmazonS3/latest/dev/ServerSideEncryptionCustomerKeys.html)

## Client-Side Encryption

You encrypt your data client-side and upload the encrypted data to Amazon S3. In this case, you manage the encryption process, encryption keys, and related tools.

To configure client-side encryption, see [Protecting data by using client-side encryption](https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingClientSideEncryption.html).

```sh
1. Create bucket
2. bundle exec ruby client-side-encryption.rb
```