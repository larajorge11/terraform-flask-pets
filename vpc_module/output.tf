output "vpc_id" {
    value = aws_vpc.ecs_vpc.id
}

output "subnet" {
    value = aws_subnet.ecs_subnet_public.*.id
}

output "vpc_cidr" {
    value = aws_vpc.ecs_vpc.cidr_block
}