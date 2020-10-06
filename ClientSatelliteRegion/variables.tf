variable "region" {
    type = string
}
variable "main_region" {
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
    Site = "Client.SatelliteRegion"
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

variable "client_main_region_vpc_id" {
    description = "client main region vpc id"
}

variable "bastionhost_ami" {
  description = "bastionhost ami"
}