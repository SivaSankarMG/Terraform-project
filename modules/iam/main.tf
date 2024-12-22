# Create IAM role for EC2 instance

resource "aws_iam_role" "ec2_s3_role" {
  name               = var.ec2_s3_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      }
    ]
  })
}

# Create IAM policy allowing EC2 to access the S3 bucket
resource "aws_iam_policy" "ec2_s3_policy" {
  name        = var.ec2_s3_role_name
  description = "Allows EC2 instance to retrieve objects from S3"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action = [ "s3:PutObject", 
                   "s3:GetObject", 
                   "s3:DeleteObject", 
                   "s3:ListBucket", 
                   "s3:PutObjectAcl", 
                   "s3:GetObjectAcl" 
                 ] 
        Resource = [
          "arn:aws:s3:::${var.s3_bucket_name}",
          "arn:aws:s3:::${var.s3_bucket_name}/*"
        ]
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  policy_arn = aws_iam_policy.ec2_s3_policy.arn
  role       = aws_iam_role.ec2_s3_role.name
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_s3_role.name
}



resource "aws_s3_bucket_policy" "example_bucket_policy" {
  bucket = var.s3_bucket_name  
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/images/*"
        Principal = "*"
      },
      { Effect = "Allow" 
        Action = [ "s3:PutObject", 
                   "s3:GetObject", 
                   "s3:DeleteObject", 
                   "s3:ListBucket", 
                   "s3:PutObjectAcl", 
                   "s3:GetObjectAcl" 
                 ] 
        Resource = [ "arn:aws:s3:::${var.s3_bucket_name}", "arn:aws:s3:::${var.s3_bucket_name}/*" ] 
        Principal = { AWS = "arn:aws:iam::${var.account_id}:role/${aws_iam_role.ec2_s3_role.name}" } 
      }
    ]
  })
}