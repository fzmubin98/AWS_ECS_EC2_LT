## Ecs Task execution role

data "aws_iam_policy_document" "ecs_task-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}


resource "aws_iam_role" "ecsTaskExecution_role2" {
  name               = "ecsTaskExecution_role2"
  assume_role_policy = data.aws_iam_policy_document.ecs_task-assume-role-policy.json
}
resource "aws_iam_role_policy" "ecsTaskExecution_policy" {
  name = "ecsTaskExecPolicy"
  role = aws_iam_role.ecsTaskExecution_role2.id

  policy = file("policies/ecsTaskExecutionPolicy.json")
}





#ecs role for Ec2 instance

data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecsinstance_role2" {
  name               = "ecsinstance_role2"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
}
resource "aws_iam_role_policy" "ecspolicy" {
  name   = "ecspolicy2"
  role   = aws_iam_role.ecsinstance_role2.id
  policy = file("policies/ecsInstancePolicy.json")
}
resource "aws_iam_instance_profile" "ecs_role" {
  name = "ecs_role2"
  role = aws_iam_role.ecsinstance_role2.name
}