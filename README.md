# Multi-Environment Infrastructure on AWS

A production-grade infrastructure project demonstrating Terraform best practices with dev, staging, and production environments.

## What This Is
Infrastructure as Code (IaC) using Terraform to manage AWS resources across three isolated environments. All deployments are automated, reproducible, and version-controlled.

## Tech Stack
- **Terraform**: Infrastructure as Code
- **AWS**: VPC, EC2, security groups, CloudWatch
- **Git**: Version control and GitOps
- **GitHub Actions**: CI/CD automation (coming soon)

## Project Structure
terraform/
├── main.tf # Core AWS resources
├── variables.tf # Input variables
├── outputs.tf # Deployment outputs
└── environments/
├── dev/ # Development environment
├── staging/ # Staging environment
└── prod/ # Production environment
docs/
└── architecture.md # Architecture documentation

  ## Getting Started
```bash
# Clone repo
git clone https://github.com/YOUR_USERNAME/multi-environment-infrastructure-aws.git
cd multi-environment-infrastructure-aws

# Deploy to dev (coming Week 1)
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

## Status
**Week 1**: Foundation setup and initial architecture planning.
