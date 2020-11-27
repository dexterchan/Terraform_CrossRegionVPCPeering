module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.64.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets
  //enable_nat_gateway     = var.vpc_enable_nat_gateway
  //one_nat_gateway_per_az = true
  tags                 = var.vpc_tags
  enable_dns_hostnames = true
  enable_dns_support   = true

}

resource "aws_security_group" "app-traffic" {
  name        = "app-traffic"
  description = "Allow HTTP/HTTPS inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "tcp from VPC"
    from_port   = 8194
    to_port     = 8194
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
    Name = "app-traffic"
  }
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
    cidr_blocks = [ var.vpc_cidr ]
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



