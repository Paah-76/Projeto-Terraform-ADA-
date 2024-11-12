# Saídas dos IDs de recursos essenciais

output "vpc_id" {
  description = "O ID do VPC"
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Lista de IDs publicas subnets"
  value = aws_subnet.public[*].id
}

output "bucket" {
  description = "Bucket do S3"
  value = aws_s3_bucket.my_bucket.bucket
}

output "ec2_instance_ids" {
  description = "Lista de IDs das instâncias EC2"
  value = aws_instance.machine_ec2[*].id
}

output "db_subnet_group_subnets" {
  description = "Lista de grupo de subnets para o banco de dados RDS"
  value = aws_db_subnet_group.database-1.subnet_ids
}
