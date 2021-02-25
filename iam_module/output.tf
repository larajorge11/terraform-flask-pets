output "aws_iam_role_autoscaling_arn" {
    value = aws_iam_role.autoscaling_role.arn
}

output "aws_iam_role_ec2_arn" {
    value = aws_iam_role.ec2_role.arn
}

output "aws_iam_role_ecs_arn" {
    value = aws_iam_role.ecs_role.arn
}

output "aws_iam_role_ecsexecutionntask_arn" {
    value = aws_iam_role.ecstaskexecution_role.arn
}