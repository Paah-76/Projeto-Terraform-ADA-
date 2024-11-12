# Configuração do Load Balancer, Target Group e Listener para tráfego HTTP

resource "aws_lb" "front_end" {
  name = "${var.environment}-front-end-lb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.lb_sec.id]
  subnets = aws_subnet.public[*].id

  enable_deletion_protection = true

  tags = {
    Name = "${var.environment}-front-end-lb"
    Environment = var.environment
    Managed_by = "terraform"
  }
}

resource "aws_lb_target_group" "main" {
  name = "${var.environment}-front-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id
  target_type = "instance"

  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 30
    matcher = "200"
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name = "${var.environment}-target-group"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.front_end.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_lb_target_group_attachment" "front_end" {
  count = length(aws_instance.machine_ec2)
  target_group_arn = aws_lb_target_group.main.arn
  target_id = aws_instance.machine_ec2[count.index].id
  port = 80
}
