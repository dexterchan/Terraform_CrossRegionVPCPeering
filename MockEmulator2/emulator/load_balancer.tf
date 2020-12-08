module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name = "my-alb"

  load_balancer_type = "network"

  vpc_id          = var.vpc_id
  subnets         = var.subnet_ids
  
  create_lb = true

  target_groups = [
    {
      name_prefix      = "emu"
      backend_protocol = "TCP"
      backend_port     = var.port
      target_type      = "instance"
      health_check = {
        enabled  = true
        interval            = "30"
        protocol            = "TCP"
        healthy_threshold   = 3
        unhealthy_threshold = 3
      }
      stickiness = {
        type            = "lb_cookie"
        cookie_duration = 120
        enabled         = true
      }
    }
  ]

  tags = var.tags
}

