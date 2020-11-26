
provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.testPubKey
}

module "emulator" {
  source               = "./emulator"
  region               = var.region
  LOGGRP               = var.emulator_cw_loggrp
  dockerimage          = var.MockEmulator_image
  ami                  = var.emulator_ami
  subnet_id            = module.vpc.public_subnets[0]
  security_groups      = [aws_security_group.app-traffic.id]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
}

