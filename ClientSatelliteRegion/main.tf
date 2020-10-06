terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "FAKE_CLIENT_SAT"
  region  = var.region
}

provider "aws" {
  alias  = "main"
  profile = "FAKE_CLIENT_MAIN"
  region = var.main_region

  # Accepter's credentials.
}


resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.testPubKey
}


resource "aws_instance" "bastion" {
  key_name      = aws_key_pair.deployer.key_name
  ami           = var.bastionhost_ami
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
  ami           = var.bastionhost_ami
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
