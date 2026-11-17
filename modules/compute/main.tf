# Módulo de computo para el servicio de notificaciones
# Este módulo define los recursos de EC2, Load Balancer y Auto Scaling Group

resource "aws_launch_template" "notification_service" {
  name_prefix   = "${var.project_name}-${var.environment}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.security_group_id]
    subnet_id                   = var.subnet_id
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(
      {
        Name        = "${var.project_name}-${var.environment}-instance"
        Project     = var.project_name
        Environment = var.environment
      },
      var.tags
    )
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              echo "Configurando instancia para servicio de notificaciones"
              # Aquí iría la configuración específica de la aplicación
              EOF
              )
}

resource "aws_lb" "notification_service" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false

  tags = merge(
    {
      Name        = "${var.project_name}-${var.environment}-alb"
      Project     = var.project_name
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_lb_target_group" "notification_service" {
  name     = "${var.project_name}-${var.environment}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = merge(
    {
      Name        = "${var.project_name}-${var.environment}-tg"
      Project     = var.project_name
      Environment = var.environment
    },
    var.tags
  )
}

resource "aws_lb_listener" "notification_service" {
  load_balancer_arn = aws_lb.notification_service.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.notification_service.arn
  }
}

resource "aws_autoscaling_group" "notification_service" {
  name                = "${var.project_name}-${var.environment}-asg"
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.private_subnet_ids

  launch_template {
    id      = aws_launch_template.notification_service.id
    version = "$Latest"
  }

  target_group_arns    = [aws_lb_target_group.notification_service.arn]
  health_check_type    = var.health_check_type
  health_check_grace_period = var.health_check_grace_period

  tag {
    key                 = "Name"
    value               = "${var.project_name}-${var.environment}-asg"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project_name
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}

resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.project_name}-${var.environment}-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.notification_service.name
}

resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.project_name}-${var.environment}-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.notification_service.name
}

# Outputs del módulo compute
output "load_balancer_dns_name" {
  description = "DNS name del Application Load Balancer"
  value       = aws_lb.notification_service.dns_name
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = aws_lb.notification_service.arn
}

output "load_balancer_zone_id" {
  description = "Zone ID del Application Load Balancer"
  value       = aws_lb.notification_service.zone_id
}

output "autoscaling_group_name" {
  description = "Nombre del Auto Scaling Group"
  value       = aws_autoscaling_group.notification_service.name
}

output "autoscaling_group_arn" {
  description = "ARN del Auto Scaling Group"
  value       = aws_autoscaling_group.notification_service.arn
}

output "launch_template_id" {
  description = "ID del Launch Template"
  value       = aws_launch_template.notification_service.id
}

output "target_group_arn" {
  description = "ARN del Target Group"
  value       = aws_lb_target_group.notification_service.arn
}