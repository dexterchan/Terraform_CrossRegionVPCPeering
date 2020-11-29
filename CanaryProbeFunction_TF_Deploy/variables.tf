variable "lambda_handler"{
  type = string
}
variable "lambda_runtime"{
  type = string
}
variable "lambda_memory_size"{
  type = number
}
variable "lambda_execrole"{
  description = "arn of lambda execution role"
  type = string
}

variable "lambda_id"{
  type = string
}

variable "s3_bucket"{
  type = string
}
variable "s3_key"{
  type = string
}
variable "timeout"{
  type = number
  default = 360
}
variable "zfp"{
  type = bool
}
variable "region"{
  type = string
}

variable "zfp_cert_bucket"{
  description = "zfp certificate s3 bucket"
  type=string
}

variable "run_schedule"{
  description = "run schedule of lambda by Eventbridge"
  default = "rate(5 minutes)"
}