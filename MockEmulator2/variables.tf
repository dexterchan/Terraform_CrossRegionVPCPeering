variable "region" {
  type = string
}

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
variable "vpc_endpoint_subnets" {
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

variable "module_tags"{
  description = "tags to apply to whole setup"
}

variable "min_size" {
  description = "min size"
  default     = 1
}

variable "max_size" {
  description = "max size"
  default     = 100
}

variable "MockEmulator_image" {
  description = "Mock Emulator image"
}

variable "nginx_proxy_task_docker_image" {
  description = "nginx proxy task docker image"
}

variable "vpc_endpointsvc_allowed_principals" {
  description = "vpc endpoint allowed principals"
  type        = list(string)
}

variable "emulator_cw_loggrp" {
  type = string
}

variable "emulator_ami" {
  type = string
}

variable "numOfServiceInstances" {
  description = "number of Service instance"
}

variable "monitor_vpc_name"{
  description = "name of vpc"
  default = "monitor-vpc"
}
variable "monitor_vpc_azs" {
  description = "Availability zones for VPC"
}
variable "monitor_vpc_private_subnets" {
  description = "Private subnets for VPC"
}
variable "monitor_vpc_public_subnets"{
  description = "Public subnets for VPC"
}