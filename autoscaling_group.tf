#
# AutoScaling resources
#
data "template_file" "container_instance_base_cloud_config" {
  template = "${file("${path.module}/cloud-config/base-container-instance.yml.tpl")}"

  vars {
    ecs_cluster_name               = "${aws_ecs_cluster.this.name}"
    ecs_private_registry           = "${var.ecs_private_registry}"
  }
}

data "template_cloudinit_config" "container_instance_cloud_config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.container_instance_base_cloud_config.rendered}"
  }
}

module "autoscaling" {
  source = "github.com/terraform-aws-modules/terraform-aws-autoscaling?ref=v1.2.0"

  # Launch configuration
  lc_name = "${var.name}_LaunchConfiguration"

  iam_instance_profile = "${aws_iam_instance_profile.container_instance.name}"
  image_id             = "${var.ami_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = "${var.security_group_ids}"
  key_name             = "${var.key_name}"
  user_data            = "${data.template_cloudinit_config.container_instance_cloud_config.rendered}"

  # Auto scaling group
  asg_name            = "${var.name}_AutoScalingGroup"
  vpc_zone_identifier = "${var.subnet_ids}"
  health_check_type   = "EC2"
  min_size            = "${var.min_size}"
  max_size            = "${var.max_size}"
  desired_capacity    = "${var.desired_capacity}"
  health_check_grace_period = "${var.asg_health_check_grace_period}"
  default_cooldown = "${var.asg_default_cooldown}"
  protect_from_scale_in = "${var.asg_protect_from_scale_in}"
  termination_policies = ["${var.asg_termination_policies}"]

  tags = "${var.tags}"
}
