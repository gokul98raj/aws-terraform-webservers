# Two-Tier Web Server with AWS ALB and EC2 Instances

This Terraform project deploys a two-tier web server architecture on AWS. The infrastructure includes an Application Load Balancer (ALB) for distributing traffic and EC2 instances as web servers. The project is designed to be scalable and highly available.

## Prerequisites

* Terraform installed on your local machine.
* AWS account with appropriate IAM permissions for managing ALB, EC2, VPC, security groups, and IAM roles.

## Architecture

* **Application Load Balancer (ALB)**: Distributes incoming traffic to web server instances.
* **EC2 Instances**: Act as web servers to handle application logic and serve content.
* **Security Groups**: Ensures secure communication within and outside of the network.

## Usage

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

- Once deployment is complete, the ALB DNS name will be displayed. Use this DNS to access the web application.
- Verify the EC2 instances are registered with the ALB.

### 6. Destroy Resources

To tear down the infrastructure, run:

```bash
terraform destroy
```

## Variables

The following variables can be customized in the `terraform.tfvars` file:

* `region`: AWS region for deployment.
* `instance_type`: EC2 instance type for web servers.
* `alb_listener_port`: Port for the ALB listener (default: 80).
* `webserver_ami_id`: AMI ID for the EC2 instances.

Refer to `variables.tf` for a complete list of configurable parameters.

## Outputs

The following outputs are available after deployment:

* `alb_dns`: DNS name of the Application Load Balancer.
* `instance_ids`: IDs of the deployed EC2 instances.
