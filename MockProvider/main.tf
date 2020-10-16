provider "aws" {
  profile = "FAKE_VENDOR"
  region  = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.testPubKey
}
/*
resource "aws_instance" "bastion" {
  key_name      = aws_key_pair.deployer.key_name
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.bastion_ssh.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "bastion"
  }
}*/
