resource "aws_launch_configuration" "lc_week_7" {
    name            = "${var.common_name}-lc"
    image_id        =  var.instance_ami
    instance_type   =  var.instance_type
    security_groups = [local.allow_http, local.allow_ssh, local.allow_icmp]

    user_data = file("${path.module}/resources/install-resources.sh")

    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_autoscaling_group" "asg_week_7" {
    name = "${var.common_name}-asg"
    launch_configuration = aws_launch_configuration.lc_week_7.name
    vpc_zone_identifier = var.vpc_subnets_ids
    
    target_group_arns = [aws_lb_target_group.tg-week-7.arn]
    health_check_type = "ELB"

    desired_capacity = var.desired_capacity
    max_size         = var.max_size
    min_size         = var.min_size

    tag {
        key                 = "Name"
        value               = var.common_name
        propagate_at_launch = true
    }
}

resource "aws_lb_target_group" "tg-week-7" {
    name     = "${var.common_name}-tg"
    port     = local.http_port
    protocol = "HTTP"
    vpc_id   = var.vpc_id

    health_check {
        path = "/index.php"
        protocol = "HTTP"
        matcher = 200
        interval = 15
        timeout = 3
        healthy_threshold = 2
        unhealthy_threshold = 2
    }
}

resource "aws_autoscaling_policy" "asg_plc_up_week_7" {
    name                   = "${var.common_name}-asg_plc_up"
    scaling_adjustment     = 1
    adjustment_type        = "ChangeInCapacity"
    cooldown               = 300
    autoscaling_group_name = aws_autoscaling_group.asg_week_7.name
}

resource "aws_autoscaling_policy" "asg_plc_down_week_7" {
    name                   = "${var.common_name}-asg_plc_down"
    scaling_adjustment     = -1
    adjustment_type        = "ChangeInCapacity"
    cooldown               = 300
    autoscaling_group_name = aws_autoscaling_group.asg_week_7.name
}