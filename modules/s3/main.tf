resource "aws_s3_bucket" "imgS3" {
  bucket = var.bucket_name  
}

# Bucket policy will be updated after creation of IAM role and policy

resource "aws_s3_bucket_public_access_block" "imgS3_bucket_public_access_block" {
  bucket = aws_s3_bucket.imgS3.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "name" {
  bucket = aws_s3_bucket.imgS3.id
  key = var.dest_path
  source = var.src_path
  etag = filemd5(var.src_path)
}


