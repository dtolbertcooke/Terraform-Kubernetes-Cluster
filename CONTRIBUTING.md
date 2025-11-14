# Contributing to Terraform Kubernetes Cluster

First off, thank you for considering contributing to this project! It's people like you that make this project such a great tool.

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the existing issues as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps which reproduce the problem**
- **Provide specific examples to demonstrate the steps**
- **Describe the behavior you observed after following the steps**
- **Explain which behavior you expected to see instead and why**
- **Include Terraform version, AWS provider version, and OS**

### Suggesting Enhancements

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- **Use a clear and descriptive title**
- **Provide a step-by-step description of the suggested enhancement**
- **Provide specific examples to demonstrate the steps**
- **Describe the current behavior and explain which behavior you expected to see instead**
- **Explain why this enhancement would be useful**

### Pull Requests

- Fill in the required template
- Do not include issue numbers in the PR title
- Include screenshots and animated GIFs in your pull request whenever possible
- Follow the Terraform style guide
- Include thoughtfully-worded, well-structured tests
- Document new code based on the Documentation Styleguide
- End all files with a newline

## Development Process

1. Fork the repo
2. Create a new branch from `main`
3. Make your changes
4. Add tests for your changes
5. Run the test suite
6. Commit your changes
7. Push to your fork
8. Create a pull request

### Local Development Setup

```bash
# Clone your fork
git clone https://github.com/your-username/terraform-kubernetes-cluster.git
cd terraform-kubernetes-cluster

# Install dependencies
terraform init

# Run validation
terraform validate
terraform fmt -check -recursive

# Run security checks
checkov -d infrastructure/
```

### Testing

Before submitting a pull request, please ensure:

1. **Terraform validation passes**: `terraform validate`
2. **Code is properly formatted**: `terraform fmt -recursive`
3. **Security scans pass**: Run Checkov or similar tools
4. **Documentation is updated**: Update README and inline comments

### Terraform Guidelines

- Use consistent naming conventions
- Add appropriate tags to all resources
- Use variables instead of hardcoded values
- Include outputs for important resource attributes
- Add comments for complex logic
- Follow the module structure patterns established in the project

### Commit Message Guidelines

We follow conventional commits:

- `feat:` new feature
- `fix:` bug fix
- `docs:` documentation changes
- `style:` formatting changes
- `refactor:` code refactoring
- `test:` adding tests
- `chore:` maintenance tasks

Example: `feat: add support for spot instances in node groups`

## Recognition

Contributors will be recognized in our README file and release notes.

## Questions?

Feel free to open an issue with the question label or reach out to the maintainers.

Thank you for contributing! 🚀
