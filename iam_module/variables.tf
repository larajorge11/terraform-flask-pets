variable "autoscaling_role_name" {}
variable "autoscaling_policy_name" {}

variable "ec2_role_name" {}
variable "ec2_policy_name" {}

variable "ecs_role_name" {}
variable "ecs_policy_name" {}

variable "ecsexecutiontask_role_name" {}
variable "ecsexecutiontask_policy_name" {}

variable "POLICY_AUTOSCALING_ASSUME_NAME" {
    default = "autoscaling_assume_role_policy.json"
}

variable "POLICY_AUTOSCALING_NAME" {
    default = "autoscaling_role_policy.json"
}

variable "POLICY_EC2_ASSUME_NAME" {
    default = "ec2_assume_role_policy.json"
}

variable "POLICY_EC2_NAME" {
    default = "ec2_role_policy.json"
}

variable "POLICY_ECS_ASSUME_NAME" {
    default = "ecs_assume_role_policy.json"
}

variable "POLICY_ECS_NAME" {
    default = "ecs_role_policy.json"
}

variable "POLICY_ECSTASKEXECUTION_ASSUME_NAME" {
    default = "ecsexecutiontask_assume_role_policy.json"
}

variable "POLICY_ECSTASKEXECUTION_NAME" {
    default = "ecsexecutiontask_role_policy.json"
}