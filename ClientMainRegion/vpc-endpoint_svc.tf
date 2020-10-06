

resource "aws_vpc_endpoint" "webmkt_service" {
  vpc_id            = module.vpc.vpc_id
  service_name      = var.app_endpoint_svc_name
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.webapp_tcp.id,
  ]

  subnet_ids          = module.vpc.private_subnets
  private_dns_enabled = false
}