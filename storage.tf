# AWS S3 BUCKET
resource "aws_s3_bucket" "bucket01" {
  bucket = "cloudacia-apache-conf"
  acl    = "private"
  tags = {
    Name = "Wordpress"
  }
}

# AWS UPLOAD FILE TO S3 BUCKET
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.bucket01.id
  key    = "httpd.conf"
  acl    = "private"
  source = "files/httpd.conf"
}
