region="us-east-1"
key_name="mocksshkey"
testPubKey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDjVLK0R0ckYd4RI8WtXRYGa+uJou8ef3brDpH2Por/FNU5/2mFe0Ow3cTBec98UgOzdrKQTkyk16zAFYLIRf0MfPOHAm+9Wl5sYFaueTGdv86nHKFFijXG0fxcsESFeoZiFdwpUcqh+lsHkdBtZaEkBBiC/DhAKastd4nn3GtAuRLs9bmZ773MZbq6uioeZyJY8X5lPBrjn23hYIPZ4+n0oJvlsyTxhz06fwBB0bWYzHObkgAPra6mSDjmHkTwrebGWkK06qVPAkBiCH6m4IWHIKSD6bb8tEzYy1ruUJPCCinYwkxkIoEIKN2fdkELf9tslea+lJqAx65ojxAk4Dds/00CKywKM1i/6+MY/aidBn3tPVx9S4reUxoyw1vNYgcOYMsqsnfyK4wPNOX9lQe3yPvmroveyv7JXZwnDkhw4NSujxE5faBNJ2ezvQhOVLl4nS11lXrFKt3p815tubhoWxD21XPiGppKywy8mEt76Yop16i8NBDyj6eDhYR01bE= dexter"

#VPC configuration
vpc_name="vendorvpc"
vpc_azs=["us-east-1a", "us-east-1c"]
vpc_cidr="192.168.0.0/16"
vpc_public_subnets=["192.168.1.0/24","192.168.2.0/24"]
vpc_private_subnets=["192.168.101.0/24", "192.168.102.0/24","192.168.103.0/24"]
vpc_endpoint_subnets = ["192.168.103.0/24"]

vpc_enable_nat_gateway=false
vpc_tags={
    Terraform   = "true"
    Environment = "dev"
  }


# task docker image
MockEmulator_image="192592784707.dkr.ecr.us-east-1.amazonaws.com/websocket-bpipe-emulator:v1.alpine"
nginx_proxy_task_docker_image="192592784707.dkr.ecr.us-east-1.amazonaws.com/bpipe-appliance-proxy:v1.alpine"
vpc_endpointsvc_allowed_principals=["arn:aws:iam::119217677828:user/TerraformDeploy"]

emulator_ami="ami-0750fb546dc51f13f"

emulator_cw_loggrp="emulator"

min_size=1
max_size=10

numOfServiceInstances=2