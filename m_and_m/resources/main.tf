/*
Terraform configurations for all findr clusters.
*/

provider "aws" {
  region  = var.aws_region
  profile = var.profile
}

# Create the IAM role
resource "aws_iam_role" "m_and_m_role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2024-01-24",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com" # or another AWS service
        },
      },
    ],
  })
}

# Create a custom inline policy
resource "aws_iam_role_policy" "m_and_m_policy" {
  name   = var.policy_name
  role   = aws_iam_role.m_and_m_role.id

  policy = jsonencode({
    Version = "2024-01-24",
    Statement = [
      {
        Sid = "Statement",
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:PutObject"
        ],
        Resource = [
          "arn:aws:s3:::${var.s3_bucket_name}/*",
          "arn:aws:s3:::${var.s3_bucket_name}"
        ],
      },
    ],
  })
}