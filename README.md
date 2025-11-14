# Terraform Kubernetes Cluster

A comprehensive Infrastructure as Code (IaC) solution for deploying and managing Kubernetes clusters on AWS using Terraform. This project demonstrates enterprise-grade cloud infrastructure patterns with observability, security, and scalability built-in.

## Architecture

This project provisions:

- **AWS EKS Cluster** with managed node groups
- **VPC and Networking** with public/private subnets
- **IAM Roles and Policies** with OIDC integration for GitHub Actions
- **Observability Stack** with CloudWatch dashboards, alarms, and logging
- **API Gateway** for external service exposure
- **Lambda Functions** for serverless workloads
- **S3 Buckets** for artifact storage
- **DynamoDB Tables** for application state

## Quick Start

### Prerequisites

- AWS CLI configured with appropriate permissions
- Terraform >= 1.0
- kubectl
- Git

### Deployment

1. **Clone and setup**

   ```bash
   git clone <repository-url>
   cd Terraform-Kubernetes-Cluster
   ```

2. **Configure environment**

   ```bash
   # Copy and customize environment configuration
   cp infrastructure/env/dev.yml.example infrastructure/env/dev.yml
   # Edit with your specific values
   ```

3. **Initialize and deploy**

   ```bash
   cd infrastructure
   terraform init
   terraform plan -var-file="env/dev.yml"
   terraform apply -var-file="env/dev.yml"
   ```

4. **Configure kubectl**
   ```bash
   aws eks update-kubeconfig --region <region> --name <cluster-name>
   ```

## Project Structure

```
├── infrastructure/
│   ├── main.tf              # Main Terraform configuration
│   ├── variables.tf         # Input variables
│   ├── outputs.tf           # Output values
│   ├── provider.tf          # Provider configurations
│   ├── remote-state.tf      # Remote state configuration
│   ├── backend/
│   │   └── global/          # Global infrastructure resources
│   ├── env/                 # Environment-specific configurations
│   │   ├── dev.yml
│   │   ├── test.yml
│   │   └── prod.yml
│   ├── my-modules/          # Custom Terraform modules
│   │   ├── dynamodb/
│   │   ├── iam/
│   │   └── lambda/
│   ├── observability/       # Monitoring and logging
│   └── resources/           # AWS resource definitions
│       ├── api-gateway/
│       ├── iam/
│       ├── lambda/
│       └── s3/
└── .github/
    └── workflows/           # CI/CD pipelines
```

## Configuration

### Environment Files

Each environment (dev/test/prod) has its own YAML configuration file in `infrastructure/env/`:

```yaml
# Example dev.yml
region: "us-west-2"
cluster_name: "my-eks-cluster"
node_instance_type: "t3.medium"
node_capacity_type: "ON_DEMAND"
# ... other configurations
```

### Terraform Variables

Key variables can be found in `infrastructure/variables.tf`. Override them using:

- Environment files (`-var-file="env/dev.yml"`)
- Command line (`-var="cluster_name=my-cluster"`)
- Environment variables (`TF_VAR_cluster_name=my-cluster`)

## Security

- **IAM Roles**: Least privilege access with specific role-based permissions
- **OIDC Integration**: Secure GitHub Actions authentication without long-lived credentials
- **Network Security**: Private subnets for worker nodes, public subnets for load balancers
- **Encryption**: EBS volumes and S3 buckets encrypted at rest

## Observability

The project includes comprehensive monitoring:

- **CloudWatch Dashboards**: Real-time cluster and application metrics
- **CloudWatch Alarms**: Automated alerting for critical thresholds
- **CloudWatch Logs**: Centralized logging for all components
- **X-Ray Tracing**: Distributed tracing for Lambda functions

## CI/CD

GitHub Actions workflows provide:

- **Terraform validation** and planning on PRs
- **Automated deployment** on merge to main
- **Security scanning** with checkov/tfsec
- **Cost estimation** with Infracost

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Documentation

- [Architecture Decision Records](docs/ADRs/)
- [Terraform Module Documentation](infrastructure/my-modules/)
- [Troubleshooting Guide](docs/troubleshooting.md)

## Versioning

This project uses [Semantic Versioning](https://semver.org/). For available versions, see the [tags on this repository](https://github.com/your-username/terraform-kubernetes-cluster/tags).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- AWS EKS documentation and best practices
- Terraform AWS Provider documentation
- Kubernetes community resources
