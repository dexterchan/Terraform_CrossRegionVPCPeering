resource "aws_vpc_endpoint_service" "mktsvc" {
  acceptance_required        = false
  network_load_balancer_arns = [aws_lb.fargate.arn]
  allowed_principals = var.vpc_endpointsvc_allowed_principals
}
