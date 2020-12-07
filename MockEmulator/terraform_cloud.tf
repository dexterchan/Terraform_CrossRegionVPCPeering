terraform {
  backend "remote" {
    organization = "dextest"
    workspaces {
      name = "aws-bpipe-mock-emulator"
    }
  }
}
