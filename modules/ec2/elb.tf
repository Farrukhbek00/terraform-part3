resource "aws_lb" "elb" {
  name               = "elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.elb_sg_id]
  subnets            = [var.subnet_public_1_id, var.subnet_public_2_id]

  enable_deletion_protection = false
    tags = {
    Environment = "elb-example"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.test.arn

    }
}

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  target_type="instance"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.Public-ec2-1.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "test1" {
  target_group_arn = aws_lb_target_group.test.arn
  target_id        = aws_instance.Public-ec2-2.id
  port             = 80
}