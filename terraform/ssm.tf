resource "aws_ssm_parameter" "bucket" {
  name  = "${var.service}-bucket-name"
  type  = "String"
  value = aws_s3_bucket.public_bucket.bucket
}

resource "aws_ssm_parameter" "song_id" {
  name  = "${var.service}-song-id"
  type  = "String"
  value = "2pXpURmn6zC5ZYDMms6fwa"
}

resource "aws_ssm_parameter" "data-file" {
  name  = "${var.service}-data-file"
  type  = "String"
  value = "${var.service}-data-file.csv"
}

