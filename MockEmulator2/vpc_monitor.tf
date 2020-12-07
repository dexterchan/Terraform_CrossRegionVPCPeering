module "monitor_vpc" {
  providers = {
        aws = aws.monitor
  }
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.64.0"

  name = var.monitor_vpc_name
  cidr = var.vpc_cidr

  azs             = var.monitor_vpc_azs
  private_subnets = var.monitor_vpc_private_subnets
  public_subnets  = var.monitor_vpc_public_subnets
  //enable_nat_gateway     = var.vpc_enable_nat_gateway
  //one_nat_gateway_per_az = true
  tags                 = var.vpc_tags
  enable_dns_hostnames = true
  enable_dns_support   = true

}

resource "aws_security_group" "app-monitor-traffic" {
  provider             = aws.monitor
  name        = "app-monitor-traffic"
  description = "Allow HTTP/HTTPS inbound traffic"
  vpc_id      = module.monitor_vpc.vpc_id

  ingress {
    description = "tcp from VPC"
    from_port   = 8194
    to_port     = 8194
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.vpc_tags
}


resource "aws_security_group" "monitor-vpc-endpoint-sg" {
  provider             = aws.monitor
  name        = "monitor-vpc-endpoint-sg"
  description = "Allow intra HTTP/HTTPS traffic"
  vpc_id      = module.monitor_vpc.vpc_id

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

  tags = var.vpc_tags
}



