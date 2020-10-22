variable "remote_region" {
    default = "us-east-1"
    type = string
}

variable "remote_key_name" {
  type = string
}
variable "remote_testPubKey" {}

variable "remote_vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  
  default     = {
    Terraform   = "true"
    Environment = "dev"
    Site = "Client.RemoteRegion"
  }
}

variable "remote_vpc_name" {
  description = "Name of VPC"
  type = string
}

variable "remote_vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
}

variable "remote_vpc_azs" {
  description = "Availability zones for VPC"
  type = list(string)
}

variable "remote_vpc_private_subnets" {
  description = "Private subnets for VPC"
  type = list(string)
}

variable "remote_vpc_public_subnets" {
  description = "Public subnets for VPC"
  type = list(string)
}

variable "app_port"{
    description = "application port"
    type = number
}

variable "web_port"{
    description = "web application port"
    type = number
}

variable "app_primary_endpoint_svc_name"{
    description = "app primary endpoint service name"
    type = string
}

variable "app_secondary_endpoint_svc_name"{
    description = "app secondary endpoint service name"
    type = string
}

variable "remote_bastionhost_ami" {
  description = "main bastionhost ami"
  type = string
}

variable "remote_vpc_flow_log_name" {
  description = "Main VPC Flow Log Name"
  type = string
}

variable "s3_vpc_endpoint_log_arn"{
  description = "arn s3 bucket maintaining vpc endpoint log"
  type = string
}

variable "org_region" {
    type = string
}



variable "org_vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  
  default     = {
    Terraform   = "true"
    Environment = "dev"
    Site = "Client.OriginRegion"
  }
}

variable "org_vpc_name" {
  description = "Name of VPC"
  type = string
}

variable "org_vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
}

variable "org_vpc_azs" {
  description = "Availability zones for VPC"
  type = list(string)
}

variable "org_vpc_private_subnets" {
  description = "Private subnets for VPC"
  type = list(string)
}

variable "org_vpc_public_subnets" {
  description = "Public subnets for VPC"
  type = list(string)
}

variable "org_bastionhost_ami" {
  description = "bastionhost ami"
}