# Web Server Setup with EC2 Instance

This project deploys a simple web server on an AWS EC2 instance. It uses a user-data script to automatically install and configure the web server upon instance launch. The setup can be used for basic websites, web applications, or testing environments.

## Prerequisites

1. **AWS Account**: Required to create and manage AWS resources.
2. **IAM Role/Policy**: An IAM role with permissions to launch EC2 instances and access security groups, VPCs, and S3 (optional for logs or storage).
3. **AWS CLI (optional)**: For managing and interacting with AWS services via command line.
4. **SSH Key Pair**: Used for SSH access to the EC2 instance.

## Architecture

The setup includes:

- An EC2 instance
- A user-data script to automate the installation of a web server
- Security Group to allow HTTP 

# Setup Instructions

## Step 1: Configure the Security Group
- In the AWS Console, create a Security Group to allow HTTP (port 80) and SSH (port 22) traffic.
- Attach the Security Group to your EC2 instance in Step 2.

## Step 2: Launch EC2 Instance with User Data
1. Go to the EC2 dashboard in the AWS Console.
2. Click **Launch Instance** and select an Amazon Linux 2 or Ubuntu 20.04 AMI.
3. Choose an instance type (e.g., `t2.micro` for free tier).
4. Configure instance details:
   - Select your VPC and subnet.
   - In the **User data** section, paste the user-data script above.
   - Choose or create a Key Pair to SSH into your instance.
   - Assign the Security Group created in Step 1.
5. Review and launch the instance.

## Step 3: Access the Web Server
- After the instance starts, navigate to the instance details page in the EC2 Console.
- Find the **Public IP** or **Public DNS** of the instance.
- Open a web browser and enter the Public IP/DNS. You should see the sample web page.

# Notes

- The user-data script runs only on the first boot. To re-run it, the instance must be stopped, modified, or re-launched with new user-data.
- Security configurations, such as limiting IPs for SSH access, should be carefully managed for production environments.

## Cleanup

- To avoid charges, remember to terminate your EC2 instance after testing.
