resource "aws_autoscaling_group" "terra-ASG" {
  //availability_zones  = ["us-east-1a"]
  desired_capacity    = 4
  max_size            = 6
  min_size            = 2
  vpc_zone_identifier = [aws_subnet.fazle-subnet.id]

  launch_template {
    id      = aws_launch_template.terra-LT.id
    version = "$Latest"
  }
  tag {
    key = "Name"
    value = "Fazle-Instances"
    propagate_at_launch = false
  }
}