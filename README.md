# Terraform Stacks CLI Example

This repository demonstrates how to use **Terraform Stacks**, a new feature in Terraform Cloud that allows you to define and manage infrastructure deployments across multiple environments using a component-based architecture.

## Project Overview

This example project showcases:
- **Component-based architecture**: Separate network and server components that can be reused across deployments
- **Multiple deployment environments**: Test and production environments with different configurations
- **Terraform Stacks workflow**: From initialization to deployment using the `terraform stacks` CLI

The project includes:
- Network component (`./network/`) - Creates basic networking infrastructure
- Server component (`./server/`) - Creates server instances that depend on the network
- Multiple deployment configurations (test and prod) with different input values

## Prerequisites

Before you can use this project, you need to have the following set up:

### 1. Terraform Cloud Account
- Sign up for a [Terraform Cloud](https://app.terraform.io/) account
- Create or have access to an organization in Terraform Cloud
- Ensure you have permissions to create projects and stacks

### 2. Terraform Binary
Install the Terraform CLI on your local machine:

### 3. Local Repository Setup
Clone this repository to your local machine:
```bash
git clone https://github.com/munnep/terraform_stacks_cli.git
cd terraform_stacks_cli
```

### 4. Authentication
Ensure you're authenticated with Terraform Cloud:
```bash
terraform login
```

### 5. Required Permissions
- Your Terraform Cloud user must have appropriate permissions in the organization
- The organization should have Terraform Stacks enabled (this may be in beta/preview)



## How to Use This Project

- **Initialize the Stack Configuration**
  Initialize the Terraform Stacks configuration:
  ```bash
  terraform stacks init
  ```
  Expected output:
  ```
  Success! Configuration has been initialized and more commands can now be executed.
  ```

- **Create a Stack in Terraform Cloud**
  Create a new stack in your Terraform Cloud organization:
  ```bash
  terraform stacks create -organization-name <your-org-name> -project-name <your-project-name> -stack-name <your-stack-name>
  ```

- **Generate Provider Lock Files**
  Create provider lock files for multiple platforms to ensure consistent provider versions:
  ```bash
  terraform stacks providers-lock -platform=linux_amd64 -platform=darwin_amd64 -platform=windows_amd64
  ```

- **Upload Configuration**
  Upload your current stack configuration to Terraform Cloud:
  ```bash
  terraform stacks configuration upload -organization-name <your-org-name> -project-name <your-project-name> -stack-name <your-stack-name>
  ```

- **Monitor Configuration Processing**
  Watch the configuration upload and processing status:
  ```bash
  terraform stacks configuration watch -organization-name <your-org-name> -project-name <your-project-name> -stack-name <your-stack-name>
  ```
  **Example output:**
  ```
  [Configuration Sequence Number: 1]                                                   
    ✓ Configuration: 'stc-omBWDRo9VzRGrytr'                   [Completed]        [16s] 
      - Deployment Group: 'prod_default'                      [Pending]          [3m8s]
      - Deployment Group: 'test_default'                      [Pending]          [3m8s]
  ```

- **Approve and Apply Plans**
  Once the configuration is processed, approve the deployment plans for each environment:

  **For test environment:**
  ```bash
  terraform stacks deployment-group approve-all-plans -organization-name <your-org-name> -project-name <your-project-name> -stack-name <your-stack-name> -deployment-group-name test_default
  ```

  **For production environment:**
  ```bash
  terraform stacks deployment-group approve-all-plans -organization-name <your-org-name> -project-name <your-project-name> -stack-name <your-stack-name> -deployment-group-name prod_default
  ```

## Additional Monitoring Commands

- **List deployment runs:**
  ```bash
  terraform stacks deployment-run list -organization-name <your-org-name> -project-name <your-project-name> -stack-name <your-stack-name> -deployment-group-name <deployment-group-name>
  ```

- **Watch a specific deployment run:**
  ```bash
  terraform stacks deployment-run watch -deployment-run-id <deployment-run-id>
  ```
