output "vpc_id" {
  description = "ID de la VPC principal creada"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subredes privadas"
  value       = aws_subnet.private[*].id
}

output "notification_service_security_group_id" {
  description = "ID del security group para las instancias del servicio"
  value       = aws_security_group.notification_service.id
}

output "alb_security_group_id" {
  description = "ID del security group para el ALB"
  value       = aws_security_group.alb.id
}

output "load_balancer_dns_name" {
  description = "Nombre DNS del Application Load Balancer"
  value       = module.compute.load_balancer_dns_name
}

output "load_balancer_arn" {
  description = "ARN del Application Load Balancer"
  value       = module.compute.load_balancer_arn
}

output "load_balancer_zone_id" {
  description = "Zone ID del Application Load Balancer para Route53"
  value       = module.compute.load_balancer_zone_id
}

output "autoscaling_group_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.autoscaling_group_name
}

output "autoscaling_group_arn" {
  description = "ARN del Auto Scaling Group"
  value       = module.compute.autoscaling_group_arn
}

output "launch_template_id" {
  description = "ID del Launch Template"
  value       = module.compute.launch_template_id
}

output "target_group_arn" {
  description = "ARN del Target Group del ALB"
  value       = module.compute.target_group_arn
}

output "kms_key_arn" {
  description = "ARN de la clave KMS"
  value       = aws_kms_key.notification_service.arn
}

output "kms_key_id" {
  description = "ID de la clave KMS"
  value       = aws_kms_key.notification_service.key_id
}

output "log_group_name" {
  description = "Nombre del grupo de logs de CloudWatch"
  value       = aws_cloudwatch_log_group.notification_service.name
}

output "artifacts_bucket_name" {
  description = "Nombre del bucket S3 para artefactos"
  value       = aws_s3_bucket.notification_artifacts.bucket
}

output "current_workspace" {
  description = "Workspace actual de Terraform"
  value       = terraform.workspace
}

output "environment_info" {
  description = "Información del entorno actual"
  value = {
    workspace     = terraform.workspace
    is_production = terraform.workspace == "prod"
    project       = var.project_name
  }
}