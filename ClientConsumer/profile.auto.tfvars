#Remote region parameters
remote_key_name="opensrc2"
remote_testPubKey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFlg683z6yPLcblOv6aWMtU6KcFI+GytbJRtx9P7jVGxwRxaOWu/9313hi9DhJoaA1+lNX8zO4qEfSbXtUX6PByxe0Kk8wUFH9ftQfKVj6HuqgB/kr1nA4SXwUXB9Om0hNnOQnwqkpIQ5UCo0RLX2MQTOrL0gwB4PDoH06Qm3Pqdtx56SXH/sbuPZxLRkuzNyppXMTJPlofoUU7aE3E6/gdctSo2keGzjKi7rKD7IbD6HMOOB0MwNbtl7EqpJ4A0zCvCwZ88CQ7ia2cpxc/fhIF4wniK/Z5Sle4pd2Gw7cqrlloMs0rb+LnbVgR9nalgPxDpWYSuOt7PdROrjGIe9/Yo1q/T+wnM2GbaKKrQDNfOO9vO9PE1fT5GPipjQpa04ipurmhU5vppPlclXjIlZMJmPcHd5vw7Nv86qDzndIocijdRiQkbJg8sd/hqTHrbfimdy3PYgrQGgnDfohgNddM5KiASaLVV0+iVt/riQzaeMkUBFNuQiMKdjaMx5Y9wk= client"

remote_region="ap-northeast-1"
remote_vpc_cidr="10.2.0.0/16"
remote_vpc_name="ClientVPCRemoteSite"
remote_vpc_azs = ["ap-northeast-1a", "ap-northeast-1c"]
remote_vpc_public_subnets = ["10.2.11.0/24", "10.2.12.0/24"]
remote_vpc_private_subnets = ["10.2.1.0/24", "10.2.2.0/24"]

remote_vpc_flow_log_name = "remote_vpc_endpoint_flow_log"

#Bastion host for monitoring
remote_bastionhost_ami="ami-0528a5175983e7f28"

#Origin
org_region="ap-southeast-2"
org_vpc_cidr="10.10.0.0/16"
org_vpc_name="ClientVPCoriginSite"
org_vpc_azs = ["ap-southeast-2a", "ap-southeast-2b"]
org_vpc_public_subnets = ["10.10.11.0/24", "10.10.12.0/24"]
org_vpc_private_subnets = ["10.10.1.0/24", "10.10.2.0/24"]

org_bastionhost_ami="ami-0889999c540e6ec99"

#Generic
app_port=8194
web_port=80


#S3 log bucket
s3_vpc_endpoint_log_arn = "arn:aws:s3:::boargcp-vpcendpointlog-tky"