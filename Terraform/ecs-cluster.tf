resource "aws_ecs_cluster" "ecs-cluster" {
  name = "fazle-terra-cluster"
}


resource "aws_ecs_capacity_provider" "ecs-capacity" {
  name = "capacity-provider-test2"
  auto_scaling_group_provider {
    auto_scaling_group_arn = aws_autoscaling_group.terra-ASG.arn
  }
}