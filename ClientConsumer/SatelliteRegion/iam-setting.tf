resource "aws_iam_role" "ec2_instance_role" {
    name = "ec2_satellite_instance_role"
    assume_role_policy = file("./policies/ec2-trustEntity.json")
}

resource "aws_iam_role_policy_attachment" "ec2_s3_readonly_policy" {
  role       = aws_iam_role.ec2_instance_role.id
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}