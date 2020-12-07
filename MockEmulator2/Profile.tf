provider "aws" {
  alias  = "emulator"
  profile = "FAKE_VENDOR"
  region  = var.region
}

provider "aws" {
  alias  = "monitor"
  profile = "monitor"
  region  = var.region
}