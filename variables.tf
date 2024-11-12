# Variáveis de configuração do projeto

variable "environment" {
  description = "Nome do ambiente"
  type = string
  default = "dev"
}

variable "vpc_cidr" {
  description = "Bloco CIDR da VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "Zonas de disponibilidade para subnets"
  type = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "bucket_name" {
  description = "Nome do bucket S3 para a aplicação"
  type = string
  default = "application-bucket-public-s3"
}

variable "instance_type" {
  description = "Tipo de instância EC2"
  type = string
  default = "t2.micro"
}

variable "allocated_storage" {
  description = "Armazenamento alocado para o RDS"
  type = number
  default = 100
}

variable "iops" {
  description = "IOPS para o RDS"
  type = number
  default = 3000
}
