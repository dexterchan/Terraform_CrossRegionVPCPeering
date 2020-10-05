
/*
resource "aws_lb" "main_nlb" {
  name               = "main_nlb-tf"
  internal           = true
  load_balancer_type = "network"
  subnets            = []

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}*/


module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name = "client-main-nlb"
internal = true
  load_balancer_type = "network"

  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.private_subnets

/*
  access_logs = {
    bucket = "my-nlb-logs"
  }*/

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "TCP"
      backend_port     = var.app_port
      target_type      = "ip"
    }
  ]

  http_tcp_listeners = [
    {
      port               = var.app_port
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = var.vpc_tags
}