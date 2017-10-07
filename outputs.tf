output "id" {
  value = "${aws_ecs_cluster.this.id}"
}

output "name" {
  value = "${aws_ecs_cluster.this.name}"
}

output "container_instance_ecs_for_ec2_service_role_name" {
  value = "${aws_iam_role.container_instance_ec2.name}"
}

output "ecs_service_role_name" {
  value = "${aws_iam_role.ecs_service_role.name}"
}

output "ecs_autoscale_role_name" {
  value = "${aws_iam_role.ecs_autoscale_role.name}"
}

output "ecs_service_role_arn" {
  value = "${aws_iam_role.ecs_service_role.arn}"
}

output "ecs_autoscale_role_arn" {
  value = "${aws_iam_role.ecs_autoscale_role.arn}"
}
