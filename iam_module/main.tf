# Role autoscaling
resource "aws_iam_role" "autoscaling_role" {
  name  = var.autoscaling_role_name
  assume_role_policy = file("${path.module}/${var.POLICY_AUTOSCALING_ASSUME_NAME}")
}

resource "aws_iam_policy" "autoscaling_policy" {
  name = var.autoscaling_policy_name
  policy = file("${path.module}/${var.POLICY_AUTOSCALING_NAME}")
}

resource "aws_iam_role_policy_attachment" "autoscaling_attachment" {
  role = aws_iam_role.autoscaling_role.id
  policy_arn = aws_iam_policy.autoscaling_policy.arn
}

# Role EC2Role
resource "aws_iam_role" "ec2_role" {
  name  = var.ec2_role_name
  assume_role_policy = file("${path.module}/${var.POLICY_EC2_ASSUME_NAME}")
}

resource "aws_iam_policy" "ec2_policy" {
  name = var.ec2_policy_name
  policy = file("${path.module}/${var.POLICY_EC2_NAME}")
}

resource "aws_iam_role_policy_attachment" "ec2_attachment" {
  role = aws_iam_role.ec2_role.id
  policy_arn = aws_iam_policy.ec2_policy.arn
}

# Role ECSRole
resource "aws_iam_role" "ecs_role" {
  name  = var.ecs_role_name
  assume_role_policy = file("${path.module}/${var.POLICY_ECS_ASSUME_NAME}")
}

resource "aws_iam_policy" "ecs_policy" {
  name = var.ecs_policy_name
  policy = file("${path.module}/${var.POLICY_ECS_NAME}")
}

resource "aws_iam_role_policy_attachment" "ecs_attachment" {
  role = aws_iam_role.ecs_role.id
  policy_arn = aws_iam_policy.ecs_policy.arn
}

#ECSTaskExecutionRole
resource "aws_iam_role" "ecstaskexecution_role" {
  name  = var.ecsexecutiontask_role_name
  assume_role_policy = file("${path.module}/${var.POLICY_ECSTASKEXECUTION_ASSUME_NAME}")
}

resource "aws_iam_policy" "ecstaskexecution_policy" {
  name = var.ecsexecutiontask_policy_name
  policy = file("${path.module}/${var.POLICY_ECSTASKEXECUTION_NAME}")
}

resource "aws_iam_role_policy_attachment" "ecstaskexecution_attachment" {
  role = aws_iam_role.ecstaskexecution_role.id
  policy_arn = aws_iam_policy.ecstaskexecution_policy.arn
}
