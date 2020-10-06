variable "region" {
    default = "us-west-2"
    type = string
}

variable "key_name" {
  default = "aws_humble_pig"
}
variable "testPubKey" {}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  
  default     = {
    Terraform   = "true"
    Environment = "dev"
    Site = "Client.MainRegion"
  }
}

variable "vpc_name" {
  description = "Name of VPC"
  type = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type = list(string)
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type = list(string)
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type = list(string)
}

variable "app_port"{
    description = "application port"
}
variable "app_endpoint_svc_name"{
  description = "app endpoint service name"
}

variable "bastionhost_ami" {
  description = "bastionhost ami"
}