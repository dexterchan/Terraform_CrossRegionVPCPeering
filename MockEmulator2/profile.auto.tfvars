region="us-east-1"

#VPC configuration
vpc_name="vendorvpc"
vpc_azs=["us-east-1a","us-east-1b", "us-east-1c","us-east-1d","us-east-1e","us-east-1f"]
vpc_cidr="192.168.0.0/16"
vpc_public_subnets=["192.168.1.0/24", "192.168.2.0/24","192.168.3.0/24",
"192.168.4.0/24","192.168.5.0/24","192.168.6.0/24"
]
vpc_private_subnets=["192.168.101.0/24", "192.168.102.0/24","192.168.103.0/24",
"192.168.104.0/24","192.168.105.0/24","192.168.106.0/24"
]
vpc_endpoint_subnets = ["192.168.103.0/24"]

vpc_enable_nat_gateway=false
vpc_tags={
    Terraform   = "true"
    Environment = "dev"
    "user:track"  = "network"
  }
  
monitor_vpc_name="lambdavpc"
monitor_vpc_azs=["us-east-1a","us-east-1b", "us-east-1c","us-east-1d","us-east-1e","us-east-1f"]
monitor_vpc_public_subnets=["192.168.1.0/24", "192.168.2.0/24","192.168.3.0/24",
"192.168.4.0/24","192.168.5.0/24","192.168.6.0/24"
]
monitor_vpc_private_subnets=["192.168.101.0/24", "192.168.102.0/24","192.168.103.0/24",
"192.168.104.0/24","192.168.105.0/24","192.168.106.0/24"
]


# task docker image
MockEmulator_image="192592784707.dkr.ecr.us-east-1.amazonaws.com/websocket-bpipe-emulator:v1.alpine"
nginx_proxy_task_docker_image="192592784707.dkr.ecr.us-east-1.amazonaws.com/bpipe-appliance-proxy:v1.alpine"
vpc_endpointsvc_allowed_principals=["arn:aws:iam::321670591830:user/monitor"]

emulator_ami="ami-0750fb546dc51f13f"

emulator_cw_loggrp="emulator"

min_size=1
max_size=10

numOfServiceInstances=2

module_tags={
    Terraform   = "true"
    Environment = "dev"
    "user:track"  = "service"
  }