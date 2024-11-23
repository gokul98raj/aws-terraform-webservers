# Web Server Setup with EC2 Instance

This project deploys a simple web server on an AWS EC2 instance. It uses a user-data script to automatically install and configure the web server upon instance launch. The setup can be used for basic websites, web applications, or testing environments.

## Prerequisites

1. **AWS Account**: Required to create and manage AWS resources.
2. **IAM Role/Policy**: An IAM role with permissions to launch EC2 instances and access security groups, VPCs, and S3 (optional for logs or storage).
3. **AWS CLI**: For managing and interacting with AWS services via command line.
4. **SSH Key Pair**: Used for SSH access to the EC2 instance.

## Architecture

The setup includes:

- An EC2 instance
- A user-data script to automate the installation of a web server
- Security Group to allow HTTP 

# Setup Instructions

### 1. Clone the Repository

```bash
git clone <repository-url>
cd <repository-directory>
```

### 2. Initialize Terraform

  Run `terraform init` to install necessary providers and modules.

### 3. Set Up AWS Credentials

Configure your AWS credentials by setting environment variables or using an AWS credentials file.

### 4. Apply Terraform Configuration
Execute the following command to deploy the infrastructure:

```bash
terraform apply
```

Type `yes` to confirm the changes.

### 5. Verify Deployment

- Once deployment is complete, the ALB DNS name will be displayed. Use this DNS to access the web server.
- Verify the EC2 instances are registered with the ALB.

### 6. Destroy Resources

To tear down the infrastructure, run:

```bash
terraform destroy
```

## Variables

Refer to `variables.tf` for a complete list of configurable parameters.

## Outputs

The following outputs are available after deployment:

* `alb_dns`: DNS name of the Application Load Balancer.