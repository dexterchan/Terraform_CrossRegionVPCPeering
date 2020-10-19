locals {
  vpc_id_svc           = module.vpc.vpc_id
  
  vpc-webapp_tcp_sg_svc = [
    aws_security_group.app_tcp.id,
    aws_security_group.web_tcp.id
  ]
}

resource "aws_vpc_endpoint" "primary_webmkt_service" {
  vpc_id            = local.vpc_id_svc
  service_name      = var.app_primary_endpoint_svc_name
  vpc_endpoint_type = "Interface"

  security_group_ids = local.vpc-webapp_tcp_sg_svc

  subnet_ids          = module.vpc.private_subnets
  private_dns_enabled = false

  tags = var.main_vpc_tags
}

resource "aws_vpc_endpoint" "secondary_webmkt_service" {
  vpc_id            = local.vpc_id_svc
  service_name      = var.app_secondary_endpoint_svc_name
  vpc_endpoint_type = "Interface"

  security_group_ids = local.vpc-webapp_tcp_sg_svc

  subnet_ids          = module.vpc.private_subnets
  private_dns_enabled = false

  tags = var.main_vpc_tags
}
