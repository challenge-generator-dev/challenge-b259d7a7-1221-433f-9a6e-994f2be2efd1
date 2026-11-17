# Módulo de red para el servicio de notificaciones
# Aprovisiona VPC, subnets, security groups y componentes de red relacionados

# TODO(reto): Implementar los recursos de red necesarios para el servicio de notificaciones

# Internet Gateway para la VPC
resource "aws_internet_gateway" "main" {
  # TODO(reto): Configurar el Internet Gateway con los tags apropiados
}

# Elastic IP para NAT Gateway
# TODO(reto): implementa este bloque
# resource "aws_eip" "nat" {
#   # TODO(reto): Configurar la EIP para el NAT Gateway
# }

# NAT Gateway
# TODO(reto): implementa este bloque
# resource "aws_nat_gateway" "main" {
#   # TODO(reto): Configurar el NAT Gateway con la EIP y la subnet pública
#   # Dependencia: aws_eip.nat, aws_subnet.public
# }

# Tabla de rutas para subredes públicas
# TODO(reto): implementa este bloque
# resource "aws_route_table" "public" {
#   # TODO(reto): Configurar tabla de rutas públicas con ruta a Internet Gateway
#   # TODO(reto): Asociar el gateway de internet
# }

# Tabla de rutas para subredes privadas
# TODO(reto): implementa este bloque
# resource "aws_route_table" "private" {
#   # TODO(reto): Configurar tabla de rutas privadas con ruta a NAT Gateway
#   # TODO(reto): Asociar el NAT Gateway
# }

# VPC principal
# TODO(reto): implementa este bloque
# resource "aws_vpc" "main" {
# }

# Subredes públicas
# TODO(reto): implementa este bloque
# resource "aws_subnet" "public" {
# }

# Subredes privadas
# TODO(reto): implementa este bloque
# resource "aws_subnet" "private" {
# }

# Association de subredes públicas con tabla de rutas
# TODO(reto): implementa este bloque
# resource "aws_route_table_association" "public" {
# }

# Association de subredes privadas con tabla de rutas
# TODO(reto): implementa este bloque
# resource "aws_route_table_association" "private" {
# }

# Security Group para el servicio de notificaciones
# TODO(reto): implementa este bloque
# resource "aws_security_group" "notification_service" {
# }

# Security Group para el ALB
# TODO(reto): implementa este bloque
# resource "aws_security_group" "alb" {
# }