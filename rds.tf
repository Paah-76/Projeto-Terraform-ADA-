# Configuração do banco de dados RDS com usuário e senha gerados aleatoriamente

resource "random_string" "rds_username" {
  length = 8
  special = false
  upper = false
}

resource "random_password" "rds_password" {
  length = 16
  special = true
}

resource "aws_rds_cluster" "database-1" {
  cluster_identifier = "database-1"
  availability_zones = var.availability_zones
  db_subnet_group_name = aws_db_subnet_group.database-1.name
  engine = "mysql"
  engine_version = "8.0.39"
  storage_type = "io2"
  allocated_storage = var.allocated_storage
  iops = var.iops
  master_username = random_string.rds_username.result
  master_password = random_password.rds_password.result

  tags = {
    Name = "${var.environment}-rds-cluster"
    Environment = var.environment
    Managed_by = "terraform"
  }
}
