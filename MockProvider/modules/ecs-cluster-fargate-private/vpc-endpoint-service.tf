resource "aws_vpc_endpoint_service" "mktsvc" {
  acceptance_required        = true
  network_load_balancer_arns = [aws_lb.fargate.arn]
  
}