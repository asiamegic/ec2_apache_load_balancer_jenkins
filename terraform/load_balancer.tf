resource "aws_lb" "nlb" {
  name            = "test-nlb"
  internal        = false
  load_balancer_type = "network"
  subnets         = aws_subnet.main.*.id
}

resource "aws_lb_target_group" "ec2_group" {
  name     = "ec2-group"
  port     = 80
  protocol = "TCP"
  vpc_id   = aws_vpc.main.id

  # Add the EC2 instance as a target
  target {
    id = aws_instance.test_ec2.id
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2_group.arn
  }
}
