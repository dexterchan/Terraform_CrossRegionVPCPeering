locals {
  vpc_id_svc           = module.monitor_vpc.vpc_id
  //service_name = module.ecs-private-cluster1.vpc_endpoint_service_mktsvc_service_name
  subnet_ids = module.monitor_vpc.private_subnets
  monitor-endpoint_subnets = [ module.monitor_vpc.private_subnets[0] ]
  vpc-webapp_tcp_sg_svc = [
    aws_security_group.app-monitor-traffic.id
  ]
  monitor-vpc-endpoint_security_group=[aws_security_group.monitor-vpc-endpoint-sg.id]
  region = var.region
}


/*
resource "aws_vpc_endpoint" "primary_webmkt_service" {
  provider             = aws.monitor
  vpc_id            = local.vpc_id_svc
  service_name      = local.service_name
  vpc_endpoint_type = "Interface"

  security_group_ids = local.vpc-webapp_tcp_sg_svc

  subnet_ids          = local.subnet_ids
  private_dns_enabled = false

  tags = var.vpc_tags
}*/


resource "aws_vpc_endpoint" "monitor-cloudwatch_monitoring" {
  provider             = aws.monitor
  vpc_id            = local.vpc_id_svc
  service_name      = "com.amazonaws.${local.region}.monitoring"
  vpc_endpoint_type = "Interface"

  security_group_ids  = local.monitor-vpc-endpoint_security_group
  subnet_ids          = local.monitor-endpoint_subnets
  private_dns_enabled = true
}