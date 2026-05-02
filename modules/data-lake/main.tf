variable "lake_name" {
  description = "Name of the S3 Data Lake bucket"
  type        = string
}

resource "aws_s3_bucket" "this" {
  bucket = var.lake_name
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    id     = "archive"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }
}

output "lake_arn" {
  value = aws_s3_bucket.this.arn
}
