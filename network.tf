resource "aws_vpc" "vpc-tf" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  instance_tenancy = "default"

  tags = {
    Name = "vpc-tf"
  }
}

resource "aws_subnet" "subnet-tf" {
  vpc_id     = aws_vpc.vpc-tf.id
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "subnet-tf"
  }
}

resource "aws_security_group" "allow_ssh_https" {
  name        = "allow_ssh_https"
  description = "Allow ssh/https inbound and outbound"
  vpc_id      = aws_vpc.vpc-tf.id

  tags = {
    Name = "allow_ssh_https"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_ssh_https.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.allow_ssh_https.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.allow_ssh_https.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


