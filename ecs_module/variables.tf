variable "subnets" {}
variable "ecs_security_group" {}

variable "CONTAINER_DEFINITION" {
  default = "container_definition.json.tpl"
}