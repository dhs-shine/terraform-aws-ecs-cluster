# terraform-aws-ecs-cluster

A Terraform module to create an Amazon Web Services (AWS) EC2 Container Service (ECS) cluster.

Based on [this other terraform module](https://github.com/azavea/terraform-aws-ecs-cluster)

## Usage

```tf

module "container_service_cluster" {
  source = "github.com/santi698/terraform-aws-ecs-cluster?ref=1.0.3"

  ami_id        = "ami-b2df2ca4"
  instance_type = "t2.micro"
  key_name      = "my_key"

  subnet_ids         = [...]
  security_group_ids = [...]

  root_block_device_type = "gp2"
  root_block_device_size = "10

  desired_capacity          = "1"
  min_size                  = "0"
  max_size                  = "1"

  tags = [
    {
      key                 = "Environment"
      value               = "dev"
      propagate_at_launch = true
    },
    {
      key                 = "Application"
      value               = "MyApp"
      propagate_at_launch = true
    }
  ]
}
```

## Required Variables

- `name` - The name of the cluster
- `ami_id` - Cluster instance Amazon Machine Image (AMI) ID
- `subnet_ids` - A list of subnet IDs to launch cluster instances

## Optional Variables

- `key_name` - EC2 Key pair name (default: `""`)
- `security_group_ids` - The security group ids to attach to the cluster instances (default: `[]`)
- `root_block_device_type` - Instance root block device type (default: `gp2`)
- `root_block_device_size` - Instance root block device size in gigabytes (default: `8`)
- `instance_type` - Instance type for cluster instances (default: `t2.micro`)
- `desired_capacity` - Number of EC2 instances that should be running in cluster (default: `1`)
- `min_size` - Minimum number of EC2 instances in cluster (default: `0`)
- `max_size` - Maximum number of EC2 instances in cluster (default: `1`)
- `tags` - A list of tags to attach to cluster instances (default: `[]`)

## Outputs

- `id` - The container service cluster ID
- `name` - The container service cluster name
- `container_instance_ecs_for_ec2_service_role_name` - Name of IAM role associated with EC2 container instances
- `ecs_service_role_name` - Name of IAM role for use with ECS services
- `ecs_autoscale_role_name` - Name of IAM role for use with ECS service autoscaling
- `ecs_service_role_arn` - ARN of IAM role for use with ECS services
- `ecs_autoscale_role_arn` - ARN of IAM role for use with ECS service autoscaling
