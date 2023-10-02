//Service 1
resource "aws_ecs_service" "ecs-service1" {
  name            = "Terra-service1"
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.task-difinition.arn
  desired_count   = 2 //need to change according to the tasks we want to create. We also need to change the ec2 instance count according to the desired count
  launch_type     = "EC2"
  //depends_on = [ aws_autoscaling_group.terra-ASG ]
}

//Service 2
resource "aws_ecs_service" "ecs-service3" {
  name            = "Terra-service3"
  cluster         = aws_ecs_cluster.ecs-cluster.id
  task_definition = aws_ecs_task_definition.task-difinition.arn
  desired_count   = 2 //need to change according to the tasks we want to create. We also need to change the ec2 instance count according to the desired count
  launch_type     = "EC2"
  //depends_on = [ aws_autoscaling_group.terra-ASG ]
}