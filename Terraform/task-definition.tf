resource "aws_ecs_task_definition" "task-difinition" {
  family                   = "Terra-TD"
  requires_compatibilities = ["EC2"]
  task_role_arn            = aws_iam_role.ecsTaskExecution_role2.arn
  execution_role_arn       = aws_iam_role.ecsTaskExecution_role2.arn
  container_definitions = jsonencode(
    [
      {
        name      = "first"
        image     = "docker.io/fazlemubin/node-hello:latest"
        cpu       = 256
        memory    = 256
        essential = true
        portMappings = [
          {
            containerPort = 3000
            hostPort      = 3000
          }
        ]
      },

    ]
  )
}