region="ap-south-1"
key_name="opensrc2"
testPubKey="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDFlg683z6yPLcblOv6aWMtU6KcFI+GytbJRtx9P7jVGxwRxaOWu/9313hi9DhJoaA1+lNX8zO4qEfSbXtUX6PByxe0Kk8wUFH9ftQfKVj6HuqgB/kr1nA4SXwUXB9Om0hNnOQnwqkpIQ5UCo0RLX2MQTOrL0gwB4PDoH06Qm3Pqdtx56SXH/sbuPZxLRkuzNyppXMTJPlofoUU7aE3E6/gdctSo2keGzjKi7rKD7IbD6HMOOB0MwNbtl7EqpJ4A0zCvCwZ88CQ7ia2cpxc/fhIF4wniK/Z5Sle4pd2Gw7cqrlloMs0rb+LnbVgR9nalgPxDpWYSuOt7PdROrjGIe9/Yo1q/T+wnM2GbaKKrQDNfOO9vO9PE1fT5GPipjQpa04ipurmhU5vppPlclXjIlZMJmPcHd5vw7Nv86qDzndIocijdRiQkbJg8sd/hqTHrbfimdy3PYgrQGgnDfohgNddM5KiASaLVV0+iVt/riQzaeMkUBFNuQiMKdjaMx5Y9wk= dexter"

vpc_cidr="10.10.0.0/16"
vpc_name="ClientVPCSatelliteSite"
vpc_azs = ["ap-south-1a", "ap-south-1b"]
vpc_public_subnets = ["10.10.11.0/24", "10.10.12.0/24"]
vpc_private_subnets = ["10.10.1.0/24", "10.10.2.0/24"]


bastionhost_ami="ami-0e306788ff2473ccb"