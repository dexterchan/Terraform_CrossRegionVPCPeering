
resource "aws_cloudwatch_log_group" "vpc_flow_log_name" {
  name = var.vpc_flow_log_name
}

resource "aws_iam_role" "vpc_flow_log_role" {
  name = "${var.vpc_flow_log_name}_role"
  assume_role_policy = file("./policies/flowlog-entity.json")
}

resource "aws_iam_role_policy" "vpc_flow_log_policy" {
  name = "${var.vpc_flow_log_name}_policy"
  role = aws_iam_role.vpc_flow_log_role.id
  policy = file("./policies/flowlog-policy.json")
}

resource "aws_flow_log" "vpc_flow_log" {
  iam_role_arn    = aws_iam_role.vpc_flow_log_role.arn
  log_destination = aws_cloudwatch_log_group.vpc_flow_log_name.arn
  traffic_type    = "ALL"
  vpc_id          = module.vpc.vpc_id
}

resource "aws_flow_log" "s3_bucket_log" {
  log_destination      = var.s3_vpc_endpoint_log_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = module.vpc.vpc_id
}