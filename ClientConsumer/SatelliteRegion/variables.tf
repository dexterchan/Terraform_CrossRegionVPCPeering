variable "sat_region" {
    type = string
}


variable "sat_key_name" {
  type = string
}
variable "sat_testPubKey" {}


variable "sat_vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  
  default     = {
    Terraform   = "true"
    Environment = "dev"
    Site = "Client.SatelliteRegion"
  }
}

variable "sat_vpc_name" {
  description = "Name of VPC"
  type = string
}

variable "sat_vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
}

variable "sat_vpc_azs" {
  description = "Availability zones for VPC"
  type = list(string)
}

variable "sat_vpc_private_subnets" {
  description = "Private subnets for VPC"
  type = list(string)
}

variable "sat_vpc_public_subnets" {
  description = "Public subnets for VPC"
  type = list(string)
}




variable "sat_bastionhost_ami" {
  description = "bastionhost ami"
}