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
  multi-environment-infrastructure-aws/
  ├── terraform/
  │   ├── main.tf
  │   ├── variables.tf
  │   ├── outputs.tf
  │   └── environments/
  │       ├── dev/
  │       ├── staging/
  │       └── prod/
  ├── docs/
  │   └── architecture.md
  ├── .gitignore (add terraform files)
  └── README.md (initial)

## Status
**Week 1**: Foundation setup and initial architecture planning.

## Getting Started

### Prerequisites
- AWS account (free tier)
- Terraform installed
- AWS CLI configured

### Deploy to Dev Environment

```bash
cd terraform/environments/dev
terraform init
terraform plan
terraform apply
```

### View Deployed Resources

After deployment, run:
```bash
terraform output
```

This shows your instance IP, VPC ID, security group ID, and more.

### Verify in AWS Console

1. Go to AWS Console
2. Go to EC2 → Instances
3. You should see a running instance named "dev-instance"