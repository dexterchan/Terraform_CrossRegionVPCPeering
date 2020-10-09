resource "aws_iam_role" "ec2_instance_role" {
    name = "ec2_satellite_instance_role"
    assume_role_policy = file("./policies/ec2-trustEntity.json")
}

resource "aws_iam_role_policy_attachment" "ec2_s3_readonly_policy" {
  role       = aws_iam_role.ec2_instance_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}


//Setting up of SSM for managed instance begin
resource "aws_iam_role_policy_attachment" "ec2_AmazonSSMManagedInstanceCore_policy" {
  role       = aws_iam_role.ec2_instance_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ec2_AmazonSSMDirectoryServiceAccess_policy" {
  role       = aws_iam_role.ec2_instance_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMDirectoryServiceAccess"
}

resource "aws_iam_role_policy_attachment" "ec2_CloudWatchAgentServerPolicy_policy" {
  role       = aws_iam_role.ec2_instance_role.id
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

data "template_file" "ssm_s3_config" {
  template = file("./policies/ssm_s3-policy.json")
  vars = {
    region = var.sat_region
  }
}

resource "aws_iam_role_policy" "ec2_s3_ssm_instance_role_policy" {
    name = "ec2_s3_ssm_instance_role_policy"
    policy = data.template_file.ssm_s3_config.rendered
    role = aws_iam_role.ec2_instance_role.id
}
//Setting up of SSM for managed instance end