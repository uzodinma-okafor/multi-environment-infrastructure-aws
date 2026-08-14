# ==========================================
# AWS Region
# ==========================================

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

# ==========================================
# Environment
# ==========================================

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

# ==========================================
# VPC & Networking
# ==========================================

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# ==========================================
# EC2 Instance
# ==========================================

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# ==========================================
# Security Group Variables
# ==========================================

variable "ssh_port" {
  description = "SSH port for security group ingress"
  type        = number
  default     = 22
}

variable "ssh_protocol" {
  description = "Protocol for SSH access"
  type        = string
  default     = "tcp"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access. WARNING: Use your IP in production, not 0.0.0.0/0"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_egress_cidr" {
  description = "CIDR block for outbound traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# ==========================================
# Route Table Variables
# ==========================================

variable "route_destination_cidr" {
  description = "CIDR block for default route"
  type        = string
  default     = "0.0.0.0/0"
}

# ==========================================
# AMI Variables
# ==========================================

variable "ami_owner" {
  description = "AWS account ID of AMI owner (Canonical for Ubuntu)"
  type        = string
  default     = "099720109477"
}

variable "ami_name_pattern" {
  description = "Name pattern for Ubuntu AMI"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}
