# Variables específicas para el módulo de computo del servicio de notificaciones

variable "project_name" {
  description = "Nombre del proyecto para etiquetar recursos"
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "key_name" {
  description = "Nombre de la clave SSH para acceder a las instancias"
  type        = string
}

variable "security_group_id" {
  description = "ID del security group para las instancias"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet para las instancias"
  type        = string
}

variable "public_subnet_ids" {
  description = "IDs de las subnets públicas para el ALB"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "IDs de las subnets privadas para el Auto Scaling Group"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "alb_security_group_id" {
  description = "ID del security group para el ALB"
  type        = string
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
}

variable "health_check_grace_period" {
  description = "Período de gracia para el health check del Auto Scaling Group"
  type        = number
}

variable "health_check_type" {
  description = "Tipo de health check para el Auto Scaling Group"
  type        = string
}

variable "tags" {
  description = "Tags adicionales para aplicar a todos los recursos"
  type        = map(string)
  default     = {}
}