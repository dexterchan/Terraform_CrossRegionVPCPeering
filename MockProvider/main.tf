provider "aws" {
  profile = "FAKE_VENDOR"
  region  = var.region
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.testPubKey
}
