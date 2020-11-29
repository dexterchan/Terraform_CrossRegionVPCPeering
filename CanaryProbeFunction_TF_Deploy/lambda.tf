
resource "aws_lambda_function" "remote_canary" {
  function_name = "${var.lambda_id}_CanaryProbeFunction"
  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key
  handler = var.lambda_handler
  runtime = var.lambda_runtime
  timeout = var.timeout
  memory_size=var.lambda_memory_size
  role = var.lambda_execrole

  environment {
    variables = {
      ZFP = var.zfp
      BBG_CLIENTCERT_KEYID="/mktsvc/dev/BBG_CLIENTCERT_PWD"
    }
  }
}
/*
resource "aws_lambda_alias" "remote_canary_alias" {
  name             = "${var.lambda_id}_CanaryProbeFunction_alias"
  description      = "a sample description"
  function_name    = aws_lambda_function.remote_canary.function_name
  function_version = "$LATEST"
}*/


resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.remote_canary.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.schedule_run.arn
}

resource "aws_cloudwatch_event_rule" "schedule_run" {
  name                = "EventBridgeEventRule"
  description         = "run lambda regularly"
  //schedule_expression = "cron(0/1 0 * ? * * *)"
  //schedule_expression = "cron(0 */5 * ? * *)"
  schedule_expression = var.run_schedule
}

resource "aws_cloudwatch_event_target" "canarytrigger" {
  target_id = "canarytrigger"
  rule      = aws_cloudwatch_event_rule.schedule_run.name
  arn       = aws_lambda_function.remote_canary.arn

  input = data.template_file.zfp_lambdainput_config.rendered

}