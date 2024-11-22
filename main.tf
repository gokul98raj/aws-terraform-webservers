terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.7.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_instance" "web-server" {
  count                  = length(data.aws_availability_zones.available.names)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  availability_zone      = data.aws_availability_zones.available.names[count.index]
  vpc_security_group_ids = [aws_security_group.web-security-group.id]
  key_name               = var.key-pair-name
  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "web-server-${count.index + 1}"
  }

}

resource "aws_security_group" "web-security-group" {
  name        = "web-security-group"
  description = "To allow inbound web traffic"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow all the outbound rules"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_lb" "web-load-balancer" {
  name               = "web-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-security-group.id]
  subnets            = data.aws_subnets.default_vpc_subnets.ids

}

resource "aws_lb_target_group" "web-lb-target-group" {
  name     = "web-lb-target-group"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

}

resource "aws_lb_listener" "web-lb-listener" {
  load_balancer_arn = aws_lb.web-load-balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-lb-target-group.arn
  }

}

resource "aws_lb_target_group_attachment" "web-lb-tg-attachment" {
  count            = length(aws_instance.web-server)
  target_group_arn = aws_lb_target_group.web-lb-target-group.arn
  target_id        = element(aws_instance.web-server.*.id, count.index)
  port             = "80"

}