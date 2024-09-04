# GitHub-actions-terraform-cicd-code
𝗠𝗲𝗱𝘂𝘀𝗮 𝗛𝗲𝗮𝗱𝗹𝗲𝘀𝘀 𝗖𝗼𝗺𝗺𝗲𝗿𝗰𝗲 𝗣𝗹𝗮𝘁𝗳𝗼𝗿𝗺 𝗗𝗲𝗽𝗹𝗼𝘆𝗺𝗲𝗻𝘁 𝗼𝗻 𝗔𝗪𝗦 𝗘𝗖𝗦/𝗙𝗮𝗿𝗴𝗮𝘁𝗲
This repository contains the Terraform code and GitHub Actions workflow for deploying the Medusa open-source headless commerce platform backend on AWS using ECS/Fargate. 
The setup includes an automated CI/CD pipeline that builds, tests, and deploys the Medusa backend on every code change.
Project Overview
This project demonstrates how to:

Provision Infrastructure: Use Terraform to set up the necessary AWS resources, including a VPC, ECS cluster, Fargate tasks, Application Load Balancer (ALB), and supporting infrastructure.
Deploy Medusa Backend: Automatically deploy the Medusa backend on AWS ECS using Fargate.
Set Up CI/CD Pipeline: Automate the build and deployment process using GitHub Actions.
Architecture
The deployment architecture includes the following components:

VPC: A Virtual Private Cloud with public and private subnets across multiple availability zones.
ECS Cluster: An Amazon ECS cluster that runs the Medusa backend using Fargate.
Fargate Tasks: Task definitions specifying the Docker container for the Medusa backend.
ALB: An Application Load Balancer that routes traffic to the ECS tasks.
Security Groups: Security groups to control inbound and outbound traffic to the ECS tasks and ALB.
𝗥𝗲𝗽𝗼𝘀𝗶𝘁𝗼𝗿𝘆 𝗦𝘁𝗿𝘂𝗰𝘁𝘂𝗿𝗲
├── terraform/
│   ├── main.tf              # Main Terraform configuration file
│   ├── variables.tf         # Variables used in Terraform
│   ├── outputs.tf           # Outputs from Terraform (e.g., ALB DNS)
│   ├── ecs.tf               # ECS cluster and task definitions
│   ├── vpc.tf               # VPC and networking resources
│   ├── alb.tf               # Application Load Balancer setup
│   ├── security_groups.tf   # Security groups configuration
│   ├── iam_roles.tf         # IAM roles and policies
└── .github/
    └── workflows/
        └── deploy.yml       # GitHub Actions workflow 
