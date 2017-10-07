#
# AutoScaling resources
#
data "template_file" "container_instance_base_cloud_config" {
  template = "${file("${path.module}/cloud-config/base-container-instance.yml.tpl")}"

  vars {
    ecs_cluster_name = "${aws_ecs_cluster.this.name}"
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
  source = "terraform-aws-modules/autoscaling/aws"

  # Launch configuration
  lc_name = "${var.name}LaunchConfiguration"

  iam_instance_profile = "${aws_iam_instance_profile.container_instance.name}"
  image_id             = "${var.ami_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = "${var.security_group_ids}"
  key_name             = "${var.key_name}"
  user_data            = "${data.template_cloudinit_config.container_instance_cloud_config.rendered}"

  root_block_device = {
    volume_type = "${var.root_block_device_type}"
    volume_size = "${var.root_block_device_size}"
  }

  # Auto scaling group
  asg_name            = "${var.name}AutoScalingGroup"
  vpc_zone_identifier = "${var.subnet_ids}"
  health_check_type   = "EC2"
  min_size            = "${var.min_size}"
  max_size            = "${var.max_size}"
  desired_capacity    = "${var.desired_capacity}"

  tags = "${var.tags}"
}
