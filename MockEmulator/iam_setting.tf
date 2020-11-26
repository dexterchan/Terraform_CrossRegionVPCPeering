

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
