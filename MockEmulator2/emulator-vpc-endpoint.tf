locals {
  vpc_id = module.vpc.vpc_id
  endpoint_subnets = [module.vpc.private_subnets[2]]
  vpc-endpoint_security_group = [
    aws_security_group.vpc-endpoint-sg.id
  ]
  asg_route_table_ids = module.vpc.private_route_table_ids
}

//reference : https://aws.amazon.com/blogs/compute/setting-up-aws-privatelink-for-amazon-ecs-and-amazon-ecr/
resource "aws_vpc_endpoint" "cloudwatch" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.logs"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}


resource "aws_vpc_endpoint" "cloudwatch_monitoring" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.monitoring"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecs-agent" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecs-agent"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecs-telemetry" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecs-telemetry"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecs" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecs"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ecr_api" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "s3" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = local.asg_route_table_ids
}

resource "aws_vpc_endpoint" "ssm" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}




resource "aws_vpc_endpoint" "ec2messages" {
  provider             = aws.emulator
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.ec2messages"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssmmessages" {
  provider             = aws.emulator
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}


resource "aws_vpc_endpoint" "kms" {
  provider             = aws.emulator
  vpc_id            = local.vpc_id
  service_name      = "com.amazonaws.${var.region}.kms"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.vpc-endpoint_security_group
  subnet_ids          = local.endpoint_subnets
  private_dns_enabled = true
}

