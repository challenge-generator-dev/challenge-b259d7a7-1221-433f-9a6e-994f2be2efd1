# Definición de variables globales para la infraestructura del servicio de notificaciones
# Estas variables se utilizan en los módulos de red y computo, y se asignan valores específicos por entorno en terraform.tfvars

variable "project_name" {
  description = "Nombre del proyecto para etiquetar recursos"
  type        = string
  default     = "notification-service"
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "vpc_cidr_block" {
  description = "Bloque CIDR para la VPC principal"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Zonas de disponibilidad para distribuir los recursos"
  type        = list(string)
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Tamaño mínimo del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Tamaño máximo del Auto Scaling Group"
  type        = number
  default     = 4
}

variable "desired_capacity" {
  description = "Capacidad deseada del Auto Scaling Group"
  type        = number
  default     = 2
}

variable "health_check_grace_period" {
  description = "Período de gracia para el health check del Auto Scaling Group"
  type        = number
  default     = 300
}

variable "health_check_type" {
  description = "Tipo de health check para el Auto Scaling Group"
  type        = string
  default     = "ELB"
}

variable "tags" {
  description = "Tags adicionales para aplicar a todos los recursos"
  type        = map(string)
  default     = {}
}