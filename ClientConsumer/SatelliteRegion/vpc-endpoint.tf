
/*
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.sat_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = module.vpc.private_route_table_ids
}
*/

//Setting up of vpc-endpoint for ssm managed instance begin
resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.sat_region}.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.vpc-endpoint-sg.id]
  subnet_ids          = module.vpc.private_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ec2messages" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.sat_region}.ec2messages"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.vpc-endpoint-sg.id]
  subnet_ids          = module.vpc.private_subnets
  private_dns_enabled = true
}

resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id            = module.vpc.vpc_id
  service_name      = "com.amazonaws.${var.sat_region}.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.vpc-endpoint-sg.id]
  subnet_ids          = module.vpc.private_subnets
  private_dns_enabled = true
}
//Setting up of vpc-endpoint for ssm managed instance end