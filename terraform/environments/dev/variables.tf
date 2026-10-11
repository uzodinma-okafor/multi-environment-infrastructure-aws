variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"  # Free tier eligible
}
variable "route_destination_cidr" {
  description = "CIDR block for default route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ssh_port" {
  description = "SSH port number"
  type        = number
  default     = 22
}

variable "ssh_protocol" {
  description = "Protocol for SSH"
  type        = string
  default     = "tcp"
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed for SSH access"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_egress_cidr" {
  description = "CIDR blocks allowed for egress traffic"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ami_owner" {
  description = "AMI owner (Canonical for Ubuntu)"
  type        = string
  default     = "099720109477"
}

variable "ami_name_pattern" {
  description = "AMI name pattern for Ubuntu"
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}