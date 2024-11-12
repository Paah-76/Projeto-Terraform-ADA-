# Configuração das instâncias EC2

resource "aws_instance" "machine_ec2" {
  count = length(var.availability_zones)
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]
  associate_public_ip_address = true

  tags = {
    Name = "${var.environment}-ec2-instance-${count.index + 1}"
    Environment = var.environment
    Managed_by = "terraform"
  }
}
