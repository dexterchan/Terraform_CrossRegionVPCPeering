
variable "region" {
  type = string
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
variable "security_groups" {
  type = list(string)
}
variable "iam_instance_profile" {
  type = string
}
variable "tags"{
  description = "tags to apply to whole setup"
}