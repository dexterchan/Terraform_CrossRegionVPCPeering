
data "template_file" "zfp_lambdainput_config" {
  template = file("sampleInput/event_zfp.json")

  vars = {
    region            = var.region
    zfp_cert_bucket = var.zfp_cert_bucket
    id           = var.lambda_id
  }
}