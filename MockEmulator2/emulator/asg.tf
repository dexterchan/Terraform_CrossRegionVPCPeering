
resource "aws_launch_configuration" "lc_emulator" {
  image_id        = var.ami
  instance_type   = var.machineType
  security_groups = var.security_groups
  name_prefix     = "emulator-lc"

  iam_instance_profile = var.iam_instance_profile
  root_block_device {
    volume_size = "8"
    volume_type = "gp2"
  }

  lifecycle {
    create_before_destroy = true
  }
  user_data = data.template_file.user_data.rendered
  depends_on = [
    aws_cloudwatch_log_group.emulator,
  ]
} 


module "privatewebgrp_asg" {
  source = "terraform-aws-modules/autoscaling/aws"

  name = "emulator-asg"

  # Launch configuration
  #
  launch_configuration = aws_launch_configuration.lc_emulator.name
  create_lc            = false

  # Auto scaling group
  asg_name                  = "emulator-asg"
  vpc_zone_identifier       = var.subnet_ids
  health_check_type         = "EC2"
  min_size                  = var.numInstances
  max_size                  = var.numInstances
  desired_capacity          = var.numInstances
  wait_for_capacity_timeout = 0

  target_group_arns = module.alb.target_group_arns
  # target_group_arns = [aws_lb_target_group.stickyGroup.arn] not yet able to associate aws_lb_target_group into module alb
  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    }
  ]

}