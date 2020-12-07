

resource "aws_cloudwatch_log_group" "applog-nginx" {
  name              = "/ecs/terraform-svc/${var.ecs_cluster_name}-nginx"
  retention_in_days = 30
  tags = {
    Environment = "dev"
    Application = var.ecs_cluster_name
  }
}



data "template_file" "nginx_proxy_task_config" {
  template = file("task-definitions/zfpproxysvc.json")

  vars = {
    app               = "nginx-proxy"
    HOST1=var.service_host1
    HOST2=var.service_host2
    region            = var.region
    task_docker_image = var.nginx_proxy_task_docker_image
    log_grp           = aws_cloudwatch_log_group.applog-nginx.name
  }
}



resource "aws_ecs_task_definition" "nginx-proxy" {
  family                   = "nginx-proxy-staging"
  network_mode             = "awsvpc"
  task_role_arn            = var.ecs_task_app_execution_role-arn
  execution_role_arn       = var.ecs_terraform_taskexecution_role-arn
  cpu                      = 512
  memory                   = 2048
  requires_compatibilities = ["FARGATE"]
  container_definitions    = data.template_file.nginx_proxy_task_config.rendered
  tags = {
    Environment = "staging"
    Application = "nginx-proxy"
  }
  depends_on = [
    aws_cloudwatch_log_group.applog-nginx,
  ]
}

resource "aws_ecs_service" "nginx-proxy-svc" {
  name            = "nginx-proxy-svc"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.nginx-proxy.arn
  
  desired_count = var.desired_capacity
  launch_type   = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.tcp_app.arn
    container_name   = "nginx-proxy"
    container_port   = 8194
  }

  network_configuration {
    security_groups  = var.launch_config_security_group
    subnets          = var.asg_subnets
    assign_public_ip = false
  }
  depends_on = [
    aws_lb.fargate,
    aws_lb_target_group.tcp_app
  ]
}