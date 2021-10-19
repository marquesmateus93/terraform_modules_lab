resource "aws_lb" "lb_week_7" {
    name               = "${var.common_name}-lb"
    internal           = true
    load_balancer_type = "application"
    security_groups    = ["${local.allow_http}", "${local.allow_icmp}", "sg-fbd7c484"]
    subnets            = "${var.vpc_subnets_ids}"
}

resource "aws_lb_listener" "lb_ls_week_7" {
    load_balancer_arn = "${aws_lb.lb_week_7.arn}"
    port              = "${local.http_port}"
    protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
        content_type = "text/plain"
        message_body = "Passa amanhã, chapa!"
        status_code  = "404"
    }
  }
}

resource "aws_lb_listener_rule" "lb_ls_rl_week_7" {
  listener_arn = "${aws_lb_listener.lb_ls_week_7.arn}"
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-week-7.arn}"
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }
}