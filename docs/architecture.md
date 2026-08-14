# Multi-Environment Infrastructure Architecture

## Overview

This project demonstrates a production-ready multi-environment AWS infrastructure using Infrastructure as Code (Terraform). The architecture is designed for scalability, security, and repeatability across dev, staging, and production environments.

## Architecture Diagram
```
AWS Account (us-west-1)
└── VPC (10.0.0.0/16)
├── Internet Gateway
│ └── Route to 0.0.0.0/0
│
└── Public Subnet (10.0.1.0/24)
├── EC2 Instance (t3.micro)
│ └── Ubuntu 22.04 LTS
│
└── Security Group
├── Ingress: SSH (port 22) from 0.0.0.0/0
└── Egress: All traffic to 0.0.0.0/0 
```

## Components

### VPC (Virtual Private Cloud)
- **CIDR Block**: 10.0.0.0/16
- **DNS**: Enabled for both hostnames and support
- **Purpose**: Isolated network environment for AWS resources

### Public Subnet
- **CIDR Block**: 10.0.1.0/24
- **Availability Zone**: us-west-1a (automatic)
- **Auto-assign Public IP**: Enabled
- **Purpose**: Hosts resources that need internet access

### Internet Gateway
- **Function**: Enables communication between VPC and the internet
- **Routes**: Attached to route table for 0.0.0.0/0 traffic

### Security Group
- **Inbound Rules**:
  - SSH (port 22) from 0.0.0.0/0 (⚠️ WARNING: Open to world in dev, restrict in prod)
- **Outbound Rules**:
  - All traffic to 0.0.0.0/0

### EC2 Instance
- **AMI**: Latest Ubuntu 22.04 LTS (automatically selected)
- **Instance Type**: t3.micro (dev), scalable for other environments
- **Subnet**: Public Subnet (can reach internet)
- **Tags**: Name, Environment, Project, ManagedBy

## Multi-Environment Support

The same Terraform code deploys to multiple environments with different configurations:
```
dev/
├── main.tf (references)
├── variables.tf
└── terraform.tfvars (dev-specific values)

staging/
└── terraform.tfvars (staging-specific values)

prod/
└── terraform.tfvars (prod-specific values) 
```

Each environment can have different:
- Instance types (dev: t3.micro, prod: t3.small or larger)
- CIDR blocks
- Security rules
- Availability zones

## Deployment Flow

1. **Clone Repository**: `git clone <repo>`
2. **Navigate**: `cd terraform/environments/dev`
3. **Initialize**: `terraform init`
4. **Plan**: `terraform plan`
5. **Apply**: `terraform apply`
6. **Verify**: Check AWS Console for deployed resources

## Cost Optimization

- **t3.micro**: Part of AWS free tier (eligible account)
- **Storage**: Minimal (only VPC and instance)
- **Monthly Cost**: ~$5-10 (if not on free tier)

## Security Considerations

- ⚠️ **SSH CIDR**: Currently open to 0.0.0.0/0 in dev. Restrict to your IP in production.
- **Secrets**: No hardcoded credentials (uses AWS CLI configured credentials)
- **Encryption**: AWS handles encryption in transit and at rest for managed services
- **IAM**: Uses AWS default roles (can be hardened with custom policies)

## Next Steps

- Add staging/production environments with different configurations
- Implement CI/CD pipeline with GitHub Actions
- Add monitoring with CloudWatch
- Implement secrets management with AWS Secrets Manager
- Add more resources (RDS database, load balancer, etc.)
