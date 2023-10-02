data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami*amazon-ecs-optimized"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon", "self"]
}

resource "aws_launch_template" "terra-LT" {
  name_prefix            = "terra-LT"
  image_id               = data.aws_ami.amazon_linux.id//"ami-0b11163bc5cc1a53b"
  instance_type          = "t2.micro"
  user_data              = filebase64("agent.sh")
  //vpc_security_group_ids = [aws_security_group.fazle_SG_EC2.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.ecs_role.name
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.fazle_SG_EC2.id]
    subnet_id = aws_subnet.fazle-subnet.id
  }

  tags = {
    Name = "Fazle-EC2"
  }
}