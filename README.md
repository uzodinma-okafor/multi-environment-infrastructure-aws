# Multi-Environment Infrastructure Platform

**Infrastructure as Code + Terraform + AWS**

A production-ready, multi-environment AWS infrastructure platform demonstrating enterprise-grade infrastructure design, automation, and best practices.

## 🎯 Project Overview

This project showcases a complete infrastructure-as-code solution that deploys a secure, scalable AWS environment across multiple stages (dev, staging, production). It demonstrates the ability to:

- ✅ Design and automate cloud infrastructure at scale
- ✅ Apply infrastructure-as-code best practices (Terraform)
- ✅ Implement security-first architecture (security groups, least-privilege)
- ✅ Manage multi-environment deployments with code
- ✅ Document infrastructure decisions clearly

## 🏗️ What's Included

### Infrastructure Components
- **VPC** with public/private subnets for network isolation
- **Internet Gateway** for external connectivity
- **Security Groups** with configurable ingress/egress rules
- **EC2 Instances** with auto-selected Ubuntu LTS AMI
- **Route Tables** for traffic management

### Infrastructure as Code
- **Terraform** modules for all AWS resources
- **Variables** for environment-specific configuration
- **State management** with local and remote options
- **Outputs** for easy resource reference

### Multi-Environment Support
- Separate configurations for dev, staging, and production
- Environment-specific `terraform.tfvars` files
- Scalable structure for adding new environments

## 🚀 Quick Start

### Prerequisites
- [Terraform](https://www.terraform.io/downloads) v1.15+
- [AWS CLI](https://aws.amazon.com/cli/) configured with credentials
- AWS account (free tier eligible)

### Deploy in 3 Steps

```bash
# 1. Clone the repository
git clone https://github.com/uzodinma-okafor/multi-environment-infrastructure-aws.git
cd multi-environment-infrastructure-aws

# 2. Navigate to your environment
cd terraform/environments/dev

# 3. Deploy
terraform init
terraform plan
terraform apply
```

That's it! Resources will be deployed to AWS in ~2-3 minutes.

## 📁 Project Structure
```
multi-environment-infrastructure-aws/
├── terraform/ # Terraform root module
│ ├── main.tf # VPC, subnets, security groups, EC2
│ ├── variables.tf # Input variables
│ ├── outputs.tf # Output values
│ ├── terraform.tfvars # Default values
│ └── environments/
│ ├── dev/
│ │ └── terraform.tfvars # Dev-specific values
│ ├── staging/
│ │ └── terraform.tfvars # Staging-specific values
│ └── prod/
│ └── terraform.tfvars # Prod-specific values
├── docs/
│ └── architecture.md # Detailed architecture docs
├── .gitignore # Ignore .terraform, state files
└── README.md # This file
```
## 🔧 Configuration

### Environment Variables

All infrastructure values are parametrized in `variables.tf`:

| Variable | Default | Purpose |
|----------|---------|---------|
| `aws_region` | us-west-1 | AWS region for deployment |
| `environment` | dev | Environment name (dev/staging/prod) |
| `vpc_cidr` | 10.0.0.0/16 | VPC CIDR block |
| `instance_type` | t3.micro | EC2 instance type |
| `ssh_port` | 22 | SSH access port |
| `allowed_ssh_cidr` | 0.0.0.0/0 | CIDR allowed for SSH (restrict in prod!) |

### Customize for Your Environment

Edit `terraform/environments/<env>/terraform.tfvars`:

```hcl
environment     = "dev"
instance_type   = "t3.micro"
vpc_cidr        = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
```

## 📊 Architecture

See [docs/architecture.md](docs/architecture.md) for:
- Detailed architecture diagrams
- Component descriptions
- Multi-environment strategy
- Security considerations

## 🛡️ Security Features

- **Network Isolation**: VPC with public/private subnets
- **Security Groups**: Configurable ingress/egress rules
- **Resource Tagging**: Consistent tags for governance (Project, Environment, ManagedBy)
- **No Hardcoded Secrets**: Uses AWS CLI configured credentials
- **Infrastructure as Code**: All changes tracked in Git

## 💰 Cost Estimate

| Component | Free Tier | Paid Estimate |
|-----------|-----------|---------------|
| VPC | ✅ Included | $0 |
| EC2 t3.micro | ✅ 750 hours/month | ~$5-10/month if overage |
| Data Transfer | ✅ Partial | Minimal |
| **Total** | **✅ Free** | **~$5-10/month** |

## 🚢 Deployment Commands

```bash
# Navigate to terraform directory
cd terraform

# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Preview changes
terraform plan

# Apply infrastructure
terraform apply

# View outputs
terraform output

# Destroy infrastructure
terraform destroy
```

## 📝 Key Learnings

This project demonstrates:
1. **Reproducible Infrastructure**: One command deploys everything
2. **Environment Parity**: Dev, staging, prod use identical code
3. **Variable Management**: Easy customization without code changes
4. **Infrastructure Best Practices**: Proper naming, tagging, organization
5. **Git Hygiene**: Clear commit messages, meaningful structure

## 🔄 What's Next

- [ ] Add staging and production environments
- [ ] Implement CI/CD with GitHub Actions
- [ ] Add monitoring with CloudWatch and Prometheus
- [ ] Implement secrets management
- [ ] Add RDS database for persistent data
- [ ] Set up load balancing
- [ ] Implement GitOps with ArgoCD

## 📚 Resources

- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS VPC Documentation](https://docs.aws.amazon.com/vpc/)
- [Infrastructure as Code Best Practices](https://www.terraform.io/cloud-docs/recommended-practices)

## ⚠️ Important Notes

- **SSH Security**: In development, SSH is open to 0.0.0.0/0. Restrict to your IP in production.
- **Free Tier**: Ensure you're on an eligible AWS account to avoid unexpected charges.
- **State Files**: Never commit `.tfstate` files to version control.
- **Credentials**: Use AWS CLI configuration or environment variables, never hardcode credentials.

## 🤝 Contributing

Feel free to fork this project and adapt it for your own infrastructure needs.

## 📄 License

This project is open source and available for educational purposes.

---

**Built with ❤️ as part of Cloud Engineering portfolio development.**