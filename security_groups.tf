# Configuração dos grupos de segurança EC2, RDS e Load Balancer

# Grupo de segurança para instâncias EC2 (SSH, HTTP e HTTPS)
resource "aws_security_group" "ec2_security_group" {
  name = "${var.environment}-ec2-security-group"
  description = "Permitir SSH e HTTP"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-ec2-security-group"
  }
}

# Grupo de segurança para o Load Balancer (permite HTTP e HTTPS de entrada)
resource "aws_security_group" "lb_sec" {
  name = "${var.environment}-lb-sec"
  description = "Permitir tráfego HTTP e HTTPS para o Load Balancer"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-lb-security-group"
  }
}

# Grupo de segurança para o banco de dados (permite tráfego MySQL na porta 3306)
resource "aws_security_group" "database_sec" {
  name = "${var.environment}-database-sec"
  description = "Permitir tráfego MySQL para o banco de dados"
  vpc_id = aws_vpc.main.id

  ingress {
    description = "MySQL"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-database-security-group"
  }
}
