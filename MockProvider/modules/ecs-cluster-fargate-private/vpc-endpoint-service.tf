resource "aws_vpc_endpoint_service" "mktsvc_primary" {
  acceptance_required        = true
  network_load_balancer_arns = [aws_lb.fargate.arn]
  allowed_principals = var.vpc_endpointsvc_allowed_principals
}

resource "aws_vpc_endpoint_service" "mktsvc_secondary" {
  acceptance_required        = true
  network_load_balancer_arns = [aws_lb.fargate.arn]
  allowed_principals = var.vpc_endpointsvc_allowed_principals
}