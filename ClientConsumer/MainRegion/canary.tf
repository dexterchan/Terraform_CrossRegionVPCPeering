locals {
  vpc_id           = module.vpc.vpc_id
  region = var.main_region
  cidr = var.main_vpc_cidr
  endpoint_subnets = [module.vpc.private_subnets[0]]
  
  asg_route_table_ids = module.vpc.private_route_table_ids
}

resource "aws_security_group" "canary_aws_endpoints" {
  name        = "canaryEndpoint-sg"
  description = "Allow AWS vpc endpoint inbound traffic at 443"
  vpc_id      = local.vpc_id

  ingress {
    description = "AWS endpoint traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [local.cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_aws_endpoint_traffic"
  }
}

resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${local.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.canary_aws_endpoints.id]
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${local.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = local.asg_route_table_ids
}

resource "aws_vpc_endpoint" "cloudwatch" {
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${local.region}.logs"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.canary_aws_endpoints.id]
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "kms" {
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${local.region}.kms"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.canary_aws_endpoints.id]
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "cloudwatch_monitoring" {
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${local.region}.monitoring"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.canary_aws_endpoints.id]
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}