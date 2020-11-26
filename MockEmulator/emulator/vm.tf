
data "template_file" "user_data" {
  template = file("./emulator/scripts/startEmulator.sh.templ")
  vars = {
    REGION = var.region
    LOGGRP = "/ec2/${var.LOGGRP}"
    IMAGE  = var.dockerimage
  }
}

resource "aws_cloudwatch_log_group" "emulator" {
  name              = "/ec2/${var.LOGGRP}"
  retention_in_days = 30
  tags = {
    Environment = "dev"
    Application = var.LOGGRP
  }
}

resource "aws_instance" "emulator" {
  key_name        = var.ssh_key_name
  ami             = var.ami
  instance_type   = var.machineType
  subnet_id       = var.subnet_id
  user_data       = data.template_file.user_data.rendered
  security_groups = var.security_groups
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "emulator"
  }
  depends_on = [
    aws_cloudwatch_log_group.emulator,
  ]
}
