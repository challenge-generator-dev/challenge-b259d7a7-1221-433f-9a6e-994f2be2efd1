# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `modules/network/main.tf` — La fase "Configuración inicial de Terraform" (f1) practica main.tf (provider AWS, backend, workspaces) aqui: este archivo es el ejercicio (blueprint).

## Como saber que terminaste

```bash
terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Aprovisionamiento de infraestructura con Terraform para el servicio de notificaciones
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Configuración inicial de Terraform — objetivo: Configurar Terraform para trabajar con AWS y separar los entornos de desarrollo y producción. — entregable (NO resolver): Configuración de Terraform lista para ser usada en los siguientes pasos.
- Fase 2: Aprovisionamiento de la red — objetivo: Aprovisionar la red del servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Red del servicio de notificaciones aprovisionada con Terraform.
- Fase 3: Aprovisionamiento del computo — objetivo: Aprovisionar el computo del servicio de notificaciones utilizando Terraform. — entregable (NO resolver): Computo del servicio de notificaciones aprovisionado con Terraform.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: versions.tf ===
terraform {
  required_version = ">= 1.9.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.100.0"
    }
  }
}

// === ARCHIVO: providers.tf ===
provider "aws" {
  region = "us-east-1"
}

// === ARCHIVO: variables.tf ===
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

// === ARCHIVO: modules/compute/main.tf ===
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

// === ARCHIVO: modules/network/variables.tf ===
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

// === ARCHIVO: modules/compute/variables.tf ===
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

// === ARCHIVO: modules/network/main.tf ===
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

// === ARCHIVO: environments/dev/terraform.tfvars ===
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

// === ARCHIVO: main.tf ===
terraform {
  backend "s3" {
    bucket = "notification-service-terraform-state"
    key    = "infra/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "DevOps Team"
  }
  merged_tags = merge(local.common_tags, var.tags)
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "network" {
  source = "./modules/network"

  project_name           = var.project_name
  environment            = var.environment
  vpc_cidr_block         = var.vpc_cidr_block
  public_subnet_cidrs    = var.public_subnet_cidrs
  private_subnet_cidrs   = var.private_subnet_cidrs
  availability_zones     = var.availability_zones
  tags                   = local.merged_tags
  enable_nat_gateway     = true
  single_nat_gateway     = true
}

data "aws_ami" "notification_service_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.merged_tags, {
    Name = "${var.project_name}-vpc-${var.environment}"
  })
}

resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(local.merged_tags, {
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
    Type = "public"
  })
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(local.merged_tags, {
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
    Type = "private"
  })
}

resource "aws_security_group" "notification_service" {
  name        = "${var.project_name}-sg-${var.environment}"
  description = "Security group for notification service instances"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.merged_tags
}

resource "aws_security_group" "alb" {
  name        = "${var.project_name}-alb-sg-${var.environment}"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.merged_tags
}

module "compute" {
  source = "./modules/compute"

  project_name              = var.project_name
  environment               = var.environment
  ami_id                    = data.aws_ami.notification_service_ami.id
  instance_type             = var.instance_type
  key_name                  = var.environment == "prod" ? "notification-service-prod" : "notification-service-dev"
  security_group_id         = aws_security_group.notification_service.id
  subnet_id                 = aws_subnet.private[0].id
  public_subnet_ids         = aws_subnet.public[*].id
  private_subnet_ids        = aws_subnet.private[*].id
  vpc_id                    = aws_vpc.main.id
  alb_security_group_id     = aws_security_group.alb.id
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  tags                      = local.merged_tags
}

resource "terraform_data" "workspace_config" {
  input = {
    current_workspace = terraform.workspace
    is_production     = terraform.workspace == "prod"
  }
}

resource "aws_s3_bucket" "notification_artifacts" {
  bucket = "${var.project_name}-artifacts-${var.environment}"

  tags = local.merged_tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "notification_artifacts" {
  bucket = aws_s3_bucket.notification_artifacts.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "notification_artifacts" {
  bucket = aws_s3_bucket.notification_artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_cloudwatch_log_group" "notification_service" {
  name              = "/aws/${var.project_name}/${var.environment}"
  retention_in_days = var.environment == "prod" ? 30 : 7

  tags = local.merged_tags
}

resource "aws_kms_key" "notification_service" {
  description             = "KMS key for ${var.project_name} ${var.environment}"
  deletion_window_in_days = 10
  enable_key_rotation     = true

  tags = local.merged_tags
}

resource "aws_kms_alias" "notification_service" {
  name          = "alias/${var.project_name}-${var.environment}"
  target_key_id = aws_kms_key.notification_service.key_id
}

// === ARCHIVO: outputs.tf ===
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
```
