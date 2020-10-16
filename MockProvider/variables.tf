variable "region" {
  type = string
}
variable "key_name" {
  type = string
}
variable "testPubKey" {}

variable "vpc_name" {
  description = "Name of VPC"
  default     = "example-vpc"
}
variable "vpc_azs" {
  description = "Availability zones for VPC"
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
}
variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
}
variable "vpc_endpoint_subnets"{
  description = "VPC endpoint deployment subnets"
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  default     = false
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
}

variable "numOfWebAppInstances" {
  description = "number of webapp"
}


variable "min_size" {
  description = "min size"
  default     = 1
}

variable "max_size" {
  description = "max size"
  default     = 100
}

variable "webapp_task_docker_image" {
  description = "web app task docker image"
}

variable "nginx_proxy_task_docker_image" {
  description = "nginx proxy task docker image"
}

variable "vpc_endpointsvc_allowed_principals"{
  description = "vpc endpoint allowed principals"
  type = list(string)
}