resource "aws_lb" "alb" {
  name               = "ecs-node"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [module.vpc.public_subnets]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alvo.arn
  }
}

resource "aws_lb_target_group" "alvo" {
  name        = "ecs-node"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
}

output "ip" {
  value = aws_alb.alb.dns_name
}
