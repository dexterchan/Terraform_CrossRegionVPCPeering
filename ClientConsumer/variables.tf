variable "main_region" {
    default = "us-west-2"
    type = string
}

variable "main_key_name" {
  type = string
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
  description = "CIDR block for VPC"
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
    type = number
}
variable "app_endpoint_svc_name"{
    description = "app endpoint service name"
    type = string
}

variable "main_bastionhost_ami" {
  description = "main bastionhost ami"
  type = string
}

variable "main_vpc_flow_log_name" {
  description = "Main VPC Flow Log Name"
  type = string
}