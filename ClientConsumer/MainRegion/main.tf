

resource "aws_key_pair" "deployer" {
  key_name   = var.main_key_name
  public_key = var.main_testPubKey
}


resource "aws_instance" "bastion" {
  key_name      = aws_key_pair.deployer.key_name
  ami           = var.main_bastionhost_ami
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.bastion_ssh.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "bastion"
  }
}


resource "aws_instance" "testprivate" {
  key_name      = aws_key_pair.deployer.key_name
  ami           = var.main_bastionhost_ami
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[0]
  security_groups = [aws_security_group.bastion_ssh_private.id]
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "testprivate"
  }
}

