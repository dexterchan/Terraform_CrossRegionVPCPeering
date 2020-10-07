
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

    main_key_name=var.main_key_name
    main_testPubKey=var.main_testPubKey

    #Main region parameters
    main_region=var.main_region
    main_vpc_cidr=var.main_vpc_cidr
    main_vpc_name=var.main_vpc_name
    main_vpc_azs = var.main_vpc_azs
    main_vpc_public_subnets = var.main_vpc_public_subnets
    main_vpc_private_subnets = var.main_vpc_private_subnets
    main_bastionhost_ami=var.main_bastionhost_ami

    main_vpc_flow_log_name = var.main_vpc_flow_log_name

    #Generic
    app_port=var.app_port
    app_endpoint_svc_name=var.app_endpoint_svc_name

}