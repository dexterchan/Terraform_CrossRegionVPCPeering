variable "region" {
  description = "region of cluster"
}

variable "ecs_cluster_name" {
  description = "ecs cluster name"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  default     = "t2.micro"
}

variable "launch_config_security_group" {
  description = "launch config security group id list"
}

variable "vpc_id" {
  description = "vpc_id"
}

variable "key_name" {
  description = "key name"
}

variable "associate_public_ip_address" {
  description = "associate public ip address"
  default     = false
}

variable "lb_subnets" {
  description = "load balancer subnets"
}

variable "asg_subnets" {
  description = "asg subnets"
}

variable "min_size" {
  description = "min size"
}

variable "max_size" {
  description = "min size"
}

variable "desired_capacity" {
  description = "desired capacity"
}


variable "webapp_task_docker_image" {
  description = "webapp task docker image"
}

variable "nginx_proxy_task_docker_image" {
  description = "nginx proxy task docker image"
}

variable "vpc_endpointsvc_allowed_principals"{
  description = "vpc endpoint allowed principals"
  type = list(string)
}

variable "ecs_task_app_execution_role-arn"{
  description = "ecs_task_app_execution_role arn"
  type = string
}

variable "ecs_terraform_taskexecution_role-arn"{
  description = "ecs_terraform_taskexecution_role arn"
  type = string
}
