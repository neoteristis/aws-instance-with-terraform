resource "aws_security_group" "ingress-all-test" {
  name   = "allow-all-sg"
  vpc_id = aws_vpc.test-env.id

  dynamic "ingress" {
    for_each = local.security_groups
    content {
      description = ingress.value["name"]
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  // Terraform removes the default rule
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

locals {
  // Define all ports and protocols to open
  security_groups = [
    // SSH
    {
      name        = "SSH access"
      protocol    = "tcp"
      from_port   = 22
      to_port     = 22
      cidr_blocks = ["0.0.0.0/0"]
    },
    // HTTP
    {
      name        = "HTTP access"
      protocol    = "tcp"
      from_port   = 80
      to_port     = 80
      cidr_blocks = ["0.0.0.0/0"]
    },
    // HTTPS
    {
      name        = "HTTPS access"
      protocol    = "tcp"
      from_port   = 443
      to_port     = 443
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
