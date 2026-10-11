variable "environment" {
  description = "Environment name"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
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
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "multi-env-infrastructure"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}