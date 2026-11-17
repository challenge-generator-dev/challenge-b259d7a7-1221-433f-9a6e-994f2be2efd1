# ============================================================
# Valores de variables para el entorno de DESARROLLO
# Servicio de notificaciones - Terraform AWS
# ============================================================

# ------------------------------------------------------------
# Variables de entorno
# ------------------------------------------------------------
env_vars = {
  environment = "dev"
  project_name = "notification-service"
}

# ------------------------------------------------------------
# Variables de red (network module)
# ------------------------------------------------------------
network_vars = {
  vpc_cidr_block       = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
  enable_nat_gateway  = true
  single_nat_gateway  = true
}

# ------------------------------------------------------------
# Variables de compute (compute module)
# ------------------------------------------------------------
compute_vars = {
  ami_id                 = "ami-0c55b159cbfafe1f0"
  instance_type          = "t3.micro"
  key_name               = "notification-service-dev-key"
  min_size               = 2
  max_size               = 4
  desired_capacity       = 2
  health_check_grace_period = 300
  health_check_type      = "ELB"
}

# ------------------------------------------------------------
# Tags comunes para todos los recursos
# ------------------------------------------------------------
tags = {
  Project     = "notification-service"
  Environment = "dev"
  ManagedBy   = "Terraform"
  CostCenter  = "DevOps"
  Owner       = "platform-team"
}

# ------------------------------------------------------------
# Configuración adicional de red para desarrollo
# ------------------------------------------------------------
vpc_cidr_block        = "10.0.0.0/16"
public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs  = ["10.0.10.0/24", "10.0.20.0/24"]
availability_zones    = ["us-east-1a", "us-east-1b"]
instance_type         = "t3.micro"
min_size              = 2
max_size              = 4
desired_capacity      = 2
health_check_grace_period = 300
health_check_type     = "ELB"