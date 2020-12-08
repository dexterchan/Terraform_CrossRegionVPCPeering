module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name = "my-nlb"
  internal= false
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
      
    }
  ]


  http_tcp_listeners = [
    {
      port               = var.port
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = var.tags
}

