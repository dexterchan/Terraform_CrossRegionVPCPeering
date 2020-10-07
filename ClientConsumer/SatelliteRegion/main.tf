


resource "aws_key_pair" "deployer" {
  key_name   = var.sat_key_name
  public_key = var.sat_testPubKey
}


resource "aws_instance" "bastion" {
  key_name      = aws_key_pair.deployer.key_name
  ami           = var.sat_bastionhost_ami
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.bastion_ssh.id]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "bastion"
  }
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "satellite_instance_profile"
  role = aws_iam_role.ec2_instance_role.name
}

resource "aws_instance" "testprivate" {
  key_name      = aws_key_pair.deployer.key_name
  ami           = var.sat_bastionhost_ami
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[0]
  security_groups = [aws_security_group.bastion_ssh_private.id]

  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name = "testprivate"
  }

  depends_on = [aws_iam_instance_profile.instance_profile]
}
