
provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.testPubKey
}

module "emulator" {
  source       = "./emulator"
  region       = var.region
  LOGGRP       = var.emulator_cw_loggrp
  dockerimage  = var.MockEmulator_image
  ssh_key_name = aws_key_pair.deployer.key_name
  ami          = var.emulator_ami
  subnet_id    = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.app-traffic.id,
  aws_security_group.bastion_ssh.id]
}

