resource "aws_s3_bucket" "bucket_website" {   # Resource block
  bucket = var.bucket_name  # Attribute
  force_destroy = true
  
  tags = {
    Name        = "Website-hosting"
  }
}
resource "aws_s3_bucket_ownership_controls" "bucket_website-ownership" {
  bucket = aws_s3_bucket.bucket_website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_bucket_website_configuration" "bucket_website-website" {
  bucket = aws_s3_bucket.bucket_website.id

  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_bucket_public_access_block" "bucket_website-public" {
  bucket = aws_s3_bucket.bucket_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_acl" "bucket_website-acl" {
  depends_on = [ 
    aws_s3_bucket_ownership_controls.bucket_website-ownership,
    aws_s3_bucket_public_access_block.bucket_website-public
  ]
  bucket = aws_s3_bucket.bucket_website.id
  acl = "public-read"
}
resource "aws_s3_bucket_policy" "bucket_website-policy" {
  depends_on = [ 
    aws_s3_bucket_ownership_controls.bucket_website-ownership,
    aws_s3_bucket_public_access_block.bucket_website-public
  ]
  bucket = aws_s3_bucket.bucket_website.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "PublicReadGetObject",
        Effect = "Allow",
        Principal = "*",
        Action = "s3:GetObject",
        Resource = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}