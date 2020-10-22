
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  alias  = "remote"
  profile = "FAKE_CLIENT_REMOTE"
  region  = var.remote_region
}

provider "aws" {
  alias  = "org"
  profile = "FAKE_CLIENT_ORIGIN"
  region  = var.org_region
}

module "remote" {
    providers = {
        aws = aws.remote
    }
    source = "./Remote"

   key_name=var.remote_key_name
   testPubKey=var.remote_testPubKey

    #Main region parameters
   region=var.remote_region
   vpc_cidr=var.remote_vpc_cidr
   vpc_name=var.remote_vpc_name
   vpc_azs = var.remote_vpc_azs
   vpc_public_subnets = var.remote_vpc_public_subnets
   vpc_private_subnets = var.remote_vpc_private_subnets
   bastionhost_ami=var.remote_bastionhost_ami

   vpc_flow_log_name = var.remote_vpc_flow_log_name

    s3_vpc_endpoint_log_arn = var.s3_vpc_endpoint_log_arn

    org_vpc_cidr=var.org_vpc_cidr
    
    #Generic
    app_port=var.app_port
    web_port=var.web_port
    app_primary_endpoint_svc_name=var.app_primary_endpoint_svc_name
    app_secondary_endpoint_svc_name=var.app_secondary_endpoint_svc_name
}

module "original" {
    providers = {
        aws = aws.org
    }

    source="./Original"
    region=var.org_region
    
    
    vpc_cidr=var.org_vpc_cidr
    vpc_name=var.org_vpc_name
    vpc_azs = var.org_vpc_azs
    vpc_public_subnets = var.org_vpc_public_subnets
    vpc_private_subnets = var.org_vpc_private_subnets
    bastionhost_ami=var.org_bastionhost_ami
}