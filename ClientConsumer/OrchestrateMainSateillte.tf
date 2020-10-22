
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  alias  = "main"
  profile = "FAKE_CLIENT_MAIN"
  region  = var.main_region
}

provider "aws" {
  alias  = "sat"
  profile = "FAKE_CLIENT_SAT"
  region  = var.sat_region
}

module "main" {
    providers = {
        aws = aws.main
    }
    source = "./MainRegion"

   key_name=var.main_key_name
   testPubKey=var.main_testPubKey

    #Main region parameters
   region=var.main_region
   vpc_cidr=var.main_vpc_cidr
   vpc_name=var.main_vpc_name
   vpc_azs = var.main_vpc_azs
   vpc_public_subnets = var.main_vpc_public_subnets
   vpc_private_subnets = var.main_vpc_private_subnets
   bastionhost_ami=var.main_bastionhost_ami

   vpc_flow_log_name = var.main_vpc_flow_log_name

    s3_vpc_endpoint_log_arn = var.s3_vpc_endpoint_log_arn

    org_vpc_cidr=var.sat_vpc_cidr
    
    #Generic
    app_port=var.app_port
    web_port=var.web_port
    app_primary_endpoint_svc_name=var.app_primary_endpoint_svc_name
    app_secondary_endpoint_svc_name=var.app_secondary_endpoint_svc_name
}

module "satellite" {
    providers = {
        aws = aws.sat
    }

    source="./SatelliteRegion"
    region=var.sat_region
    
    
    vpc_cidr=var.sat_vpc_cidr
    vpc_name=var.sat_vpc_name
    vpc_azs = var.sat_vpc_azs
    vpc_public_subnets = var.sat_vpc_public_subnets
    vpc_private_subnets = var.sat_vpc_private_subnets
    bastionhost_ami=var.sat_bastionhost_ami
}