
variable "region" {
  type = string
}

variable "port"{
  type = number
  default = 8194
}
variable "LOGGRP" {
  type = string
}

variable "dockerimage" {
  type = string
}

variable "ami" {
  type = string
}
variable "machineType" {
  type    = string
  default = "t2.micro"
}
variable "subnet_id" {
  type = string
}
variable "subnet_ids"{
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
variable "iam_instance_profile" {
  type = string
}
variable "tags"{
  description = "tags to apply to whole setup"
}
variable "vpc_id"{
  type=string
}

variable "numInstances" {
  default = 2
}