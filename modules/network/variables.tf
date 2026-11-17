# Variables específicas para el módulo de red del servicio de notificaciones

variable "project_name" {
  description = "Nombre del proyecto para etiquetar recursos"
  type        = string
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

variable "tags" {
  description = "Tags adicionales para aplicar a todos los recursos"
  type        = map(string)
  default     = {}
}

variable "enable_nat_gateway" {
  description = "Habilitar NAT Gateway para subredes privadas"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Usar un solo NAT Gateway para todas las subredes privadas"
  type        = bool
  default     = true
}