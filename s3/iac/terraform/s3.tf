# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-trc1"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}