data "template_file" "init" {
  template = file("${path.module}/${var.CONTAINER_DEFINITION}")
}

resource "aws_ecs_cluster" "main" {
  name = "ecs_davor_fargate_2"
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family = "app"
  network_mode             = "awsvpc"
  requires_compatibilities = [ "FARGATE" ]
  cpu                      = 256
  memory                   = 512

  container_definitions = data.template_file.init.rendered
}

resource "aws_ecs_service" "main" {
  name            = "davor-ecs-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"


  network_configuration {
    subnets         = var.subnets
    security_groups = var.ecs_security_group
    assign_public_ip = true
  }
}