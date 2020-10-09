
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

  name = var.sat_vpc_name
  cidr = var.sat_vpc_cidr

  azs             = var.sat_vpc_azs
  public_subnets = var.sat_vpc_public_subnets
  private_subnets = var.sat_vpc_private_subnets
  
  enable_nat_gateway = false
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = var.sat_vpc_tags
}


resource "aws_security_group" "bastion_ssh" {
  name        = "bastion_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}


resource "aws_security_group" "bastion_ssh_private" {
  name        = "bastion_ssh_private"
  description = "Allow ssh inbound internal traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "SSH from VPC"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_ssh.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_private_ssh"
  }
}


resource "aws_security_group" "vpc-endpoint-sg" {
  name        = "vpc-endpoint-sg"
  description = "Allow intra HTTP/HTTPS traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "comm within VPC"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks = [ var.sat_vpc_cidr ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vpc-endpoint-sg"
  }
}
