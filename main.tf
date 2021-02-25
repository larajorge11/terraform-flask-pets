# Module: Roles and Policies
module "ecs_roles_module" {
  source                        = "./iam_module"

  autoscaling_role_name         = "autoscaling_role"
  autoscaling_policy_name       = "autoscaling_policy"

  ec2_role_name                 = "ec2_role"
  ec2_policy_name               = "ec2_policy"

  ecs_role_name                 = "ecs_role"
  ecs_policy_name               = "ecs_policy"

  ecsexecutiontask_role_name    = "ecsexecutiontask_role"
  ecsexecutiontask_policy_name  = "ecsexecutiontask_policy"
}

# Module: VPC, Subnets
module "ecs_vpc_module" {
  source                            = "./vpc_module"
  vpc_id                            = module.ecs_vpc_module.vpc_id
  vpc_cidr                          = "172.16.0.0/16"
  subnet_public_cidr                = ["172.16.0.0/24", "172.16.1.0/24"]
  subnet_public_availability_zone   = ["us-east-2a", "us-east-2b"]
}

# Module: Security_group
module "ecs_securitygroup" {
    source                  = "./securitygroup_module"
    vpc_id                  =  module.ecs_vpc_module.vpc_id
    cidr_blocks             = [module.ecs_vpc_module.vpc_cidr]
    SG_NAME                 = "sgecs"
}

module "ecs_cluster" {
    source = "./ecs_module"
    subnets = module.ecs_vpc_module.subnet
    ecs_security_group = [module.ecs_securitygroup.ecs_connection_id]
}

