resource "aws_s3_bucket" "lambda_upload" {
  bucket = "my-bucket-name"
  acl    = "private"
}