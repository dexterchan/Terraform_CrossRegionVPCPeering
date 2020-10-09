variable "main_region" {
    default = "us-east-1"
    type = string
}

variable "main_key_name" {
  default = "aws_humble_pig"
}
variable "main_testPubKey" {}

variable "main_vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  
  default     = {
    Terraform   = "true"
    Environment = "dev"
    Site = "Client.MainRegion"
  }
}

variable "main_vpc_name" {
  description = "Name of VPC"
  type = string
}

variable "main_vpc_cidr" {
  description = "Main CIDR block for VPC"
  type = string
}

variable "sat_vpc_cidr" {
  description = "Satellite CIDR block for VPC"
  type = string
}

variable "main_vpc_azs" {
  description = "Availability zones for VPC"
  type = list(string)
}

variable "main_vpc_private_subnets" {
  description = "Private subnets for VPC"
  type = list(string)
}

variable "main_vpc_public_subnets" {
  description = "Public subnets for VPC"
  type = list(string)
}

variable "app_port"{
    description = "application port"
}

variable "app_primary_endpoint_svc_name"{
  description = "app primary endpoint service name"
}

variable "app_secondary_endpoint_svc_name"{
  description = "app secondary endpoint service name"
}

variable "main_vpc_flow_log_name" {
  description = "Main VPC Flow Log Name"
  type = string
}

variable "s3_vpc_endpoint_log_arn"{
  description = "arn s3 bucket maintaining vpc endpoint log"
  type = string
}

variable "main_bastionhost_ami" {
  description = "bastionhost ami"
}