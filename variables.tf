variable "name" {
  type        = "string"
  description = "The name of the created cluster"
}

variable "ami_id" {
  type        = "string"
  description = "The id of the ami used for the instances, ECS optimized ami's are recommended"
}

variable "instance_type" {
  type        = "string"
  description = "The EC2 instance type for the cluster instances"
  default     = "t2.micro"
}

variable "security_group_ids" {
  type        = "list"
  description = "The security group ids to be attached to the cluster instances"
  default     = []
}

//variable "root_block_device_type" {
//  type        = "string"
//  description = "The type of the volume for the EBS volumes attached to the cluster instances"
//  default     = "gp2"
//}
//
//variable "root_block_device_size" {
//  type        = "string"
//  description = "The size of the EBS volume attached to the cluster instances"
//  default     = "8"
//}

variable "subnet_ids" {
  type        = "list"
  description = "The subnet ids where the cluster will be launched"
}

variable "min_size" {
  type        = "string"
  description = "The minimum amount of instances in the cluster"
  default     = "0"
}

variable "max_size" {
  type        = "string"
  description = "The maximum amount of instances in the cluster"
  default     = "1"
}

variable "desired_capacity" {
  type        = "string"
  description = "The amount of instances the cluster is expected to have normally"
  default     = "1"
}

variable "key_name" {
  type        = "string"
  description = "The SSH key pair name for the cluster instances"
  default     = ""
}

variable "tags" {
  type        = "list"
  description = "A list of tags to attach to cluster instances"
  default     = []
}

variable "asg_default_cooldown" {
  type        = "string"
  description = "ASG cooldown seconds"
  default     = 300
}

variable "asg_health_check_grace_period" {
  type        = "string"
  description = "ASG health check grace period"
  default     = 300
}

variable "asg_protect_from_scale_in" {
  description = "ASG protect from scale in"
  default     = false
}

variable "asg_termination_policies" {
  description = "ASG termination policies"
  default     = ["default"]
}

variable "ecs_private_registry" {
  type        = "string"
  default     = "hub.docker.com"
}

variable "ecs_private_registry_auth_data" {
  type        = "string"
  default     = ""
}
