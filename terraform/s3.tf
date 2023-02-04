resource "aws_s3_bucket" "public_bucket" {
  bucket = var.service_domain
  tags = {
    Name        = "${var.service}-public"
    Environment = "prod"
  }
}


resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.public_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }

}

resource "aws_s3_bucket_acl" "public_bucket_acl" {
  bucket = aws_s3_bucket.public_bucket.bucket
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "public_bucket_policy" {
  bucket = aws_s3_bucket.public_bucket.bucket
  policy = templatefile("s3-policy.json", {
    bucket = aws_s3_bucket.public_bucket.bucket
  })
}
