#Main region parameters
main_key_name="opensrc2"
main_testPubKey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFlg683z6yPLcblOv6aWMtU6KcFI+GytbJRtx9P7jVGxwRxaOWu/9313hi9DhJoaA1+lNX8zO4qEfSbXtUX6PByxe0Kk8wUFH9ftQfKVj6HuqgB/kr1nA4SXwUXB9Om0hNnOQnwqkpIQ5UCo0RLX2MQTOrL0gwB4PDoH06Qm3Pqdtx56SXH/sbuPZxLRkuzNyppXMTJPlofoUU7aE3E6/gdctSo2keGzjKi7rKD7IbD6HMOOB0MwNbtl7EqpJ4A0zCvCwZ88CQ7ia2cpxc/fhIF4wniK/Z5Sle4pd2Gw7cqrlloMs0rb+LnbVgR9nalgPxDpWYSuOt7PdROrjGIe9/Yo1q/T+wnM2GbaKKrQDNfOO9vO9PE1fT5GPipjQpa04ipurmhU5vppPlclXjIlZMJmPcHd5vw7Nv86qDzndIocijdRiQkbJg8sd/hqTHrbfimdy3PYgrQGgnDfohgNddM5KiASaLVV0+iVt/riQzaeMkUBFNuQiMKdjaMx5Y9wk= client"

main_region="us-east-1"
main_vpc_cidr="10.2.0.0/16"
main_vpc_name="ClientVPCMainSite"
main_vpc_azs = ["us-east-1a", "us-east-1b"]
main_vpc_public_subnets = ["10.2.11.0/24", "10.2.12.0/24"]
main_vpc_private_subnets = ["10.2.1.0/24", "10.2.2.0/24"]

main_vpc_flow_log_name = "main_vpc_endpoint_flow_log"

#Bastion host for monitoring
main_bastionhost_ami="ami-0528a5175983e7f28"

#Satellite
sat_region="ap-south-1"
sat_vpc_cidr="10.10.0.0/16"
sat_vpc_name="ClientVPCSatelliteSite"
sat_vpc_azs = ["ap-south-1a", "ap-south-1b"]
sat_vpc_public_subnets = ["10.10.11.0/24", "10.10.12.0/24"]
sat_vpc_private_subnets = ["10.10.1.0/24", "10.10.2.0/24"]

sat_bastionhost_ami="ami-0ba6a4f5e1ef8e106"
//"ami-0e306788ff2473ccb"

#Generic
app_port=8194
web_port=80

#app_primary_endpoint_svc_name="com.amazonaws.vpce.us-east-1.vpce-svc-0c078abf59c16d2a0"
#app_secondary_endpoint_svc_name="com.amazonaws.vpce.us-east-1.vpce-svc-0b2948573a91a6ddf"


#S3 log bucket
s3_vpc_endpoint_log_arn = "arn:aws:s3:::boargcp-vpcendpointlog"