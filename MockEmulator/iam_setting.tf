

resource "aws_iam_role" "ec2_mockemulator_instance_role" {
  name               = "ec2_mockemulator_instance_role"
  assume_role_policy = file("./policies/ec2-trustEntity.json")
}

resource "aws_iam_role_policy" "ec2_ssm_managed_policy" {
  name   = "ec2_ssm_managed_policy"
  policy = file("./policies/ec2-ssmmanaged.json")
  role   = aws_iam_role.ec2_mockemulator_instance_role.id
}

resource "aws_iam_role_policy_attachment" "ec2_mockemulator_s3_readonly_policy" {
  role       = aws_iam_role.ec2_mockemulator_instance_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "ec2_mockemulator_instance_profile"
  role = aws_iam_role.ec2_mockemulator_instance_role.name
}


resource "aws_iam_role" "ecs_terraform_service_role" {
    name = "ecs_terraform_service_role"
    assume_role_policy = file("./modules/policies/ecs-trustEntity.json")
}

resource "aws_iam_role_policy_attachment" "ecs_terraform_service_role_policy" {
    role = aws_iam_role.ecs_terraform_service_role.id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

resource "aws_iam_role" "ecs_terraform_taskexecution_role" {
    name = "ecs_terraform_taskexecution_role"
    assume_role_policy = file("./modules/policies/ecs-tasks-trustEntity.json")
}

resource "aws_iam_role_policy_attachment" "ecs_terraform_taskexecution_role_policy" {
    role = aws_iam_role.ecs_terraform_taskexecution_role.id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_task_app_execution_role" {
    name = "ecs_task_app_execution_role"
    assume_role_policy = file("./modules/policies/ecs-tasks-trustEntity.json")
}

resource "aws_iam_role_policy_attachment" "ecs_task_app_execution_role_s3_policy" {
    role = aws_iam_role.ecs_task_app_execution_role.id
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_task_app_execution_role_dynamodb_policy" {
    role = aws_iam_role.ecs_task_app_execution_role.id
    policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_task_app_execution_role_xraywrite_policy" {
    role = aws_iam_role.ecs_task_app_execution_role.id
    policy_arn = "arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess"
}

resource "aws_iam_role_policy_attachment" "ecs_task_app_execution_role_ssm_policy"{
    role = aws_iam_role.ecs_task_app_execution_role.id
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}

resource "aws_iam_policy" "ecs_task_app_execution_role_kms_policy" {
  name        = "kms-decrypt-policy"
  description = "Enable decryption policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "kms:Decrypt",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_task_app_execution_role_kms_policy"{
    role = aws_iam_role.ecs_task_app_execution_role.id
    policy_arn = aws_iam_policy.ecs_task_app_execution_role_kms_policy.arn
}
