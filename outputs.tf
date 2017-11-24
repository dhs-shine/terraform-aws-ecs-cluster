output "id" {
  value       = "${aws_ecs_cluster.this.id}"
  description = "The id of the ECS cluster in AWS"
}

output "name" {
  value       = "${aws_ecs_cluster.this.name}"
  description = "The name of the ECS cluster in AWS"
}

output "cluster_autoscaling_group_name" {
  value       = "${module.autoscaling.this_autoscaling_group_name}"
  description = "The group name for the ECS cluster autoscaling group"
}

output "cluster_autoscaling_group_arn" {
  value       = "${module.autoscaling.this_autoscaling_group_arn}"
  description = "The arn for the ECS cluster autoscaling group"
}

output "cluster_autoscaling_group_id" {
  value       = "${module.autoscaling.this_autoscaling_group_arn}"
  description = "The id for the ECS cluster autoscaling group"
}

output "cluster_launch_configuration_id" {
  value       = "${module.autoscaling.this_launch_configuration_id}"
  description = "The id of the launch configuration of the ECS cluster autoscaling group"
}

output "ecs_service_role_name" {
  value       = "${aws_iam_role.ecs_service_role.name}"
  description = "The role to assign to services that need to use a loadbalancer."
}

output "ecs_service_role_arn" {
  value       = "${aws_iam_role.ecs_service_role.arn}"
  description = "The role to assign to services that need to use a loadbalancer."
}

output "ecs_autoscale_role_name" {
  value = "${aws_iam_role.ecs_autoscale_role.name}"

  description = <<END
    The role to assign to resources that need to perform autoscaling.
    Assigns managed AmazonEC2ContainerServiceAutoscaleRole policy
    E.g.: Cloudwatch alarms
END
}

output "ecs_autoscale_role_arn" {
  value = "${aws_iam_role.ecs_autoscale_role.arn}"

  description = <<END
    The role to assign to resources that need to perform autoscaling.
    Assigns managed AmazonEC2ContainerServiceAutoscaleRole policy
    E.g.: Cloudwatch alarms
END
}

output "container_instance_ecs_for_ec2_service_role_name" {
  value       = "${aws_iam_role.container_instance_ec2.name}"
  description = "The role to assign to any EC2 instance that will manage or be part of the cluster"
}
