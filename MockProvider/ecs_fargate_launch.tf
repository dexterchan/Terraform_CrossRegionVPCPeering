locals {
  name        = "mkt"
  environment = "dev"

  # This is the convention we use to know what belongs to each other
  primary_ecs_resource_name = "${local.name}-1-${local.environment}"
  secondary_ecs_resource_name = "${local.name}-2-${local.environment}"
}

module "ecs-private-cluster1" {
  source = "./modules/ecs-cluster-fargate-private"
  region = var.region

  ecs_cluster_name = local.primary_ecs_resource_name


  vpc_id = module.vpc.vpc_id

  key_name = aws_key_pair.deployer.key_name

  asg_subnets      = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  lb_subnets      = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.numOfWebAppInstances

  launch_config_security_group = [
    aws_security_group.web-app.id
  ]

  task_docker_image = var.task_docker_image

  vpc_endpointsvc_allowed_principals = var.vpc_endpointsvc_allowed_principals
  
  ecs_task_app_execution_role-arn = aws_iam_role.ecs_task_app_execution_role.arn
  ecs_terraform_taskexecution_role-arn = aws_iam_role.ecs_terraform_taskexecution_role.arn
  depends_on = [
    aws_vpc_endpoint.cloudwatch,
    aws_vpc_endpoint.ecs-agent,
    aws_vpc_endpoint.ecs-telemetry,
    aws_vpc_endpoint.ecs,
    aws_vpc_endpoint.ecr_dkr,
    aws_vpc_endpoint.ecr_api
  ]
}


module "ecs-private-cluster2" {
  source = "./modules/ecs-cluster-fargate-private"
  region = var.region

  ecs_cluster_name = local.secondary_ecs_resource_name


  vpc_id = module.vpc.vpc_id

  key_name = aws_key_pair.deployer.key_name

  asg_subnets      = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  lb_subnets      = [module.vpc.private_subnets[0], module.vpc.private_subnets[1]]
  
  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.numOfWebAppInstances

  launch_config_security_group = [
    aws_security_group.web-app.id
  ]

  task_docker_image = var.task_docker_image

  vpc_endpointsvc_allowed_principals = var.vpc_endpointsvc_allowed_principals
  
  ecs_task_app_execution_role-arn = aws_iam_role.ecs_task_app_execution_role.arn
  ecs_terraform_taskexecution_role-arn = aws_iam_role.ecs_terraform_taskexecution_role.arn
  depends_on = [
    aws_vpc_endpoint.cloudwatch,
    aws_vpc_endpoint.ecs-agent,
    aws_vpc_endpoint.ecs-telemetry,
    aws_vpc_endpoint.ecs,
    aws_vpc_endpoint.ecr_dkr,
    aws_vpc_endpoint.ecr_api
  ]
}

