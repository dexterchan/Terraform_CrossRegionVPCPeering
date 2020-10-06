region="us-west-2"
key_name="opensrc2"
testPubKey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFlg683z6yPLcblOv6aWMtU6KcFI+GytbJRtx9P7jVGxwRxaOWu/9313hi9DhJoaA1+lNX8zO4qEfSbXtUX6PByxe0Kk8wUFH9ftQfKVj6HuqgB/kr1nA4SXwUXB9Om0hNnOQnwqkpIQ5UCo0RLX2MQTOrL0gwB4PDoH06Qm3Pqdtx56SXH/sbuPZxLRkuzNyppXMTJPlofoUU7aE3E6/gdctSo2keGzjKi7rKD7IbD6HMOOB0MwNbtl7EqpJ4A0zCvCwZ88CQ7ia2cpxc/fhIF4wniK/Z5Sle4pd2Gw7cqrlloMs0rb+LnbVgR9nalgPxDpWYSuOt7PdROrjGIe9/Yo1q/T+wnM2GbaKKrQDNfOO9vO9PE1fT5GPipjQpa04ipurmhU5vppPlclXjIlZMJmPcHd5vw7Nv86qDzndIocijdRiQkbJg8sd/hqTHrbfimdy3PYgrQGgnDfohgNddM5KiASaLVV0+iVt/riQzaeMkUBFNuQiMKdjaMx5Y9wk= dexter"

vpc_cidr="10.2.0.0/16"
vpc_name="ClientVPCMainSite"
vpc_azs = ["us-west-2a", "us-west-2b"]
vpc_public_subnets = ["10.2.11.0/24", "10.2.12.0/24"]
vpc_private_subnets = ["10.2.1.0/24", "10.2.2.0/24"]

bastionhost_ami="ami-0528a5175983e7f28"

app_port=80

app_endpoint_svc_name="com.amazonaws.vpce.us-west-2.vpce-svc-07be610fda53aa38c"
