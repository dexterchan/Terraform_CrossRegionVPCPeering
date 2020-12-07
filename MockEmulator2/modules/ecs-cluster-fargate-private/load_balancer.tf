resource "aws_lb" "fargate" {
  name               = "nlb-${var.ecs_cluster_name}"
  subnets            = var.lb_subnets
  load_balancer_type = "network"
  internal           = false

  tags = var.tags
}


resource "aws_lb_listener" "tcp_app_forward" {
  load_balancer_arn = aws_lb.fargate.arn
  port              = 8194
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tcp_app.arn
  }
}

resource "aws_lb_target_group" "tcp_app" {
  name        = "${var.ecs_cluster_name}-tcpapp-tg"
  port        = 8194
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    interval            = "30"
    protocol            = "TCP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

}
