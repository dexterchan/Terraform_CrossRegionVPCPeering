
provider "aws" {
  alias  = "emulator"
  profile = "FAKE_VENDOR"
  region  = var.region
}

resource "aws_key_pair" "deployer" {
  provider             = aws.emulator
  key_name   = var.key_name
  public_key = var.testPubKey
}

module "emulator1" {
  provider             = aws.emulator
  source               = "./emulator"
  region               = var.region
  LOGGRP               = "${var.emulator_cw_loggrp}1"
  dockerimage          = var.MockEmulator_image
  ami                  = var.emulator_ami
  subnet_id            = module.vpc.public_subnets[0]
  security_groups      = [aws_security_group.app-traffic.id]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
}

module "emulator2" {
  provider             = aws.emulator
  source               = "./emulator"
  region               = var.region
  LOGGRP               = "${var.emulator_cw_loggrp}2"
  dockerimage          = var.MockEmulator_image
  ami                  = var.emulator_ami
  subnet_id            = module.vpc.public_subnets[0]
  security_groups      = [aws_security_group.app-traffic.id]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
}
