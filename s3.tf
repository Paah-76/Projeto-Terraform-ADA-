# Configuração do bucket S3 e sua política de acesso

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "bucket-app"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.id
  policy = local.s3_policy
}
