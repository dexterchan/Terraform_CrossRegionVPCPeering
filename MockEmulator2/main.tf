module "emulator1" {
  providers = {
        aws = aws.emulator
  }
  source               = "./emulator"
  region               = var.region
  LOGGRP               = "${var.emulator_cw_loggrp}1"
  dockerimage          = var.MockEmulator_image
  ami                  = var.emulator_ami
  subnet_id            = module.vpc.public_subnets[0]
  security_groups      = [aws_security_group.app-traffic.id]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  tags = var.module_tags
}

module "emulator2" {
  providers = {
        aws = aws.emulator
  }
  source               = "./emulator"
  region               = var.region
  LOGGRP               = "${var.emulator_cw_loggrp}2"
  dockerimage          = var.MockEmulator_image
  ami                  = var.emulator_ami
  subnet_id            = module.vpc.public_subnets[0]
  security_groups      = [aws_security_group.app-traffic.id]
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  tags = var.module_tags
}

module "lambda_monitor1"{
  providers = {
        aws = aws.monitor
  }
  source = "git@github.com:dexterchan/CanaryProbeFunction_TF_Deploy.git"

  lambda_execrole="arn:aws:iam::321670591830:role/enterprise/CanaryLambdaExecution"
  lambda_id="monitor1"
  s3_bucket="monitor-bpipe-canary-dex-lambda-us-east-1"
  s3_key="emulator/CanaryProbeFunction-0.0.1-SNAPSHOT-emulator.zip"
  region= var.region
  subnet_ids=module.monitor_vpc.private_subnets
  securitygroup_ids=[module.monitor_vpc.default_security_group_id]
  host=aws_vpc_endpoint.primary_webmkt_service.dns_entry[0]["dns_name"]
  port=8194
  auth="test"

}
