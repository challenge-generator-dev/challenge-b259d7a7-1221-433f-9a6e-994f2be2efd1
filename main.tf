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