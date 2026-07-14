# AWS Infrastructure Automation using Terraform, Ansible and Jenkins

## Overview

This project demonstrates an end-to-end Infrastructure as Code (IaC) and Configuration Management workflow using **Terraform**, **Ansible**, **Jenkins**, **GitHub**, and **AWS**.

The solution automates AWS infrastructure provisioning, server configuration, and deployment using a parameterized Jenkins pipeline integrated with GitHub.

The project follows modern DevOps practices by combining Infrastructure as Code, Configuration Management, Continuous Integration, and automation.

---

## Solution Summary

### Workflow

```
Developer
      │
      ▼
Push Code to GitHub
      │
      ▼
Jenkins (Build with Parameters)
      │
      ▼
Terraform Init
      │
      ▼
Terraform Plan
      │
      ▼
Terraform Apply / Destroy
      │
      ▼
Provision AWS Infrastructure
      │
      ▼
SSH to Ansible Control Node
      │
      ▼
Execute Ansible Playbook
      │
      ▼
Configure Managed Node
```

---

# Infrastructure as Code (Terraform)

Terraform is used to provision and manage the complete AWS infrastructure.

Provisioned resources include:

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group
- AWS Key Pair
- Ansible Control Node
- Managed Node

## Why Terraform?

- Infrastructure as Code (IaC)
- Repeatable deployments
- Version-controlled infrastructure
- Easy infrastructure updates
- Automated provisioning
- One-command deployment and cleanup

### Most Used Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
terraform output
terraform state list
```

---

# Configuration Management (Ansible)

After infrastructure provisioning, Ansible configures the Managed Node automatically.

Tasks performed by the playbook include:

- Package update
- Install Java
- Install Git
- Install Maven
- Install Nginx
- Enable and start services

## Why Ansible?

- Agentless architecture
- SSH-based communication
- Idempotent execution
- Easy server configuration
- Consistent deployments

### Most Used Commands

```bash
ansible --version

ansible all -i inventory -m ping

ansible-playbook -i inventory playbook.yml
```

---

# Jenkins Automation

Jenkins automates the complete deployment process.

A **Parameterized Pipeline** is used to control infrastructure operations.

Available parameter:

```
ACTION

apply

destroy
```

Pipeline execution:

```
GitHub Checkout

↓

Terraform Init

↓

Terraform Validate

↓

Terraform Plan

↓

Terraform Apply / Destroy

↓

Run Ansible Playbook

↓

Deployment Completed
```

---

# GitHub Integration

GitHub acts as the central repository for:

- Terraform configuration
- Ansible playbooks
- Jenkinsfile
- Project documentation

Every infrastructure change is version controlled and can be deployed directly through Jenkins.

---

# Project Structure

```
InfraPro-TerraformTask
│
├── terraform
│   ├── provider.tf
│   ├── variables.tf
│   ├── network.tf
│   ├── security.tf
│   ├── ec2.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   └── userdata.sh
│
├── ansible
│   ├── inventory
│   └── playbook.yml
│
├── Jenkinsfile
├── .gitignore
└── README.md
```

---

# Jenkins Pipeline

The Jenkins pipeline performs the following operations:

- Pull latest code from GitHub
- Initialize Terraform
- Validate Terraform configuration
- Generate execution plan
- Provision or destroy infrastructure
- Execute Ansible playbook
- Display deployment status

---

# AWS Architecture

```
                GitHub Repository
     Terraform + Ansible + Jenkinsfile
                    │
                    ▼
          Jenkins (Windows Machine)
                    │
      Build with Parameters (apply/destroy)
                    │
                    ▼
              Terraform Execution
                    │
                    ▼
             AWS Infrastructure
        ┌──────────────────────────┐
        │                          │
        │  Ansible Control Node    │
        │        Ubuntu            │
        │                          │
        └──────────┬───────────────┘
                   │ SSH
                   ▼
        ┌──────────────────────────┐
        │      Managed Node        │
        │                          │
        │ Java                     │
        │ Git                      │
        │ Maven                    │
        │ Nginx                    │
        └──────────────────────────┘
```

---

# Design Choices

- Infrastructure managed using Terraform
- Agentless configuration using Ansible
- Parameterized Jenkins pipeline
- GitHub as the single source of truth
- Separate Control Node and Managed Node
- Infrastructure provisioning separated from server configuration
- Modular Terraform configuration for better maintainability

---

# Challenges Faced

During implementation, the following challenges were encountered:

- Configuring SSH authentication between EC2 instances
- Managing Terraform provider binaries in GitHub
- GitHub file size limitation for Terraform providers
- Jenkins AWS credential configuration
- Jenkins service running under LocalSystem account
- Dynamic inventory management for Ansible
- GitHub integration with Jenkins Pipeline

---

# Future Enhancements

- Store Terraform state in AWS S3
- Implement Terraform state locking using DynamoDB
- Configure GitHub Webhooks for automatic pipeline execution
- Replace Access Keys with IAM Roles
- Deploy applications using Docker
- Kubernetes integration
- Multi-environment deployment (Dev, QA, Production)

---

# Cleanup

Destroy all AWS resources after testing.

```bash
terraform destroy
```

---

# Conclusion

This project successfully demonstrates an automated Infrastructure as Code and Configuration Management workflow using **Terraform**, **Ansible**, **Jenkins**, **GitHub**, and **AWS**.

Terraform provisions AWS infrastructure, Ansible configures the provisioned servers, and Jenkins automates the complete deployment lifecycle using a parameterized pipeline. GitHub provides centralized version control for all infrastructure and automation code.

The implementation follows DevOps best practices by reducing manual effort, ensuring consistent deployments, enabling repeatable infrastructure provisioning, and providing a scalable foundation for future cloud automation projects.
