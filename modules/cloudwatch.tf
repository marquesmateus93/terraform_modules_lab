resource "aws_cloudwatch_metric_alarm" "cloudwatch_week7-up" {
    alarm_name                = "${var.common_name}-cloudwatch-up"
    namespace                 = "AWS/EC2"
    metric_name               = "CPUUtilization"
    statistic                 = "Average"
    period                    = "120"
    comparison_operator       = "GreaterThanOrEqualToThreshold"
    threshold                 = "70"
    evaluation_periods        = "2"
    alarm_description         = "Scale up EC2 instances."
    alarm_actions             = [aws_autoscaling_policy.asg_plc_up_week_7.arn]
}

resource "aws_cloudwatch_metric_alarm" "cloudwatch_week7-down" {
    alarm_name                = "${var.common_name}-cloudwatch-down"
    namespace                 = "AWS/EC2"
    metric_name               = "CPUUtilization"
    statistic                 = "Average"
    period                    = "120"
    comparison_operator       = "LessThanOrEqualToThreshold"
    threshold                 = "50"
    evaluation_periods        = "2"
    alarm_description         = "Scale down EC2 instances."
    alarm_actions             = [aws_autoscaling_policy.asg_plc_down_week_7.arn]
}