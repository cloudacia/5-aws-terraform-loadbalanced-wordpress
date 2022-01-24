# AWS S3 BUCKET
resource "aws_s3_bucket" "bucket01" {
  bucket = "s3-python-web-app-hello-world"
  acl    = "private"
  tags = {
    Name = "Hello World App"
  }
}

# AWS UPLOAD FILE TO S3 BUCKET
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucket01.id
  key    = "http-server.py"
  acl    = "private"
  source = "app/http-server.py"
}
