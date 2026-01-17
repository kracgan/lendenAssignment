# DevSecOps Assignment – Secure Cloud Infrastructure with AI Remediation

## Project Overview

This project demonstrates core **DevSecOps principles** by building, securing, and automating the deployment of a web application using **Docker, Terraform, Jenkins, Trivy, and Generative AI**.

The objective is to ensure that **cloud infrastructure is secure by default**, detect security flaws early using CI/CD pipelines, and leverage **AI-driven remediation** to fix vulnerabilities before deployment.

---

## Architecture Overview

### High-Level Workflow

1. A simple **Node.js web application** is containerized using Docker.
2. **Terraform** provisions cloud infrastructure on **AWS**.
3. **Jenkins (running in Docker)** automates:
   - Code checkout
   - Terraform security scanning using **Trivy**
   - Terraform planning
4. An **intentional security vulnerability** is introduced in Terraform.
5. **AI** analyzes the Trivy report and recommends secure fixes.
6. Terraform is updated and re-scanned to ensure **zero critical issues**.
7. Infrastructure is deployed and accessed via a **public IP**.

---

## Cloud Provider

- **Amazon Web Services (AWS)**

### Services Used
- EC2 (Virtual Machine)
- Security Groups
- Elastic IP
- Encrypted Root Volumes

---

## Tools & Technologies

| Category | Tools |
|--------|------|
| Application | Node.js |
| Containerization | Docker, Docker Compose |
| Infrastructure as Code | Terraform |
| CI/CD | Jenkins (Docker) |
| Security Scanning | Trivy |
| AI Assistance | Generative AI (ChatGPT) |
| Cloud | AWS |

---

## Web Application & Docker

- A simple **Node.js web application** was selected.
- Docker artifacts created:
  - `Dockerfile`
  - `docker-compose.yml`
- The application runs successfully **locally using Docker**.

---

## Infrastructure as Code (Terraform)

Terraform provisions the following resources:

- EC2 instance
- Security Group (network rules)
- Encrypted root disk
- Elastic IP for stable public access

---

## Intentional Security Vulnerability (Initial State)

As required by the assignment, the initial Terraform configuration intentionally included security flaws such as:

- SSH (port 22) open to `0.0.0.0/0`
- Overly permissive firewall rules
- Publicly exposed services

These vulnerabilities were intentionally introduced for later remediation.

---

## CI/CD Pipeline (Jenkins)

Jenkins is executed locally using Docker.

### Pipeline Stages

#### Stage 1: Checkout
- Pulls source code from GitHub.

#### Stage 2: Infrastructure Security Scan
- Uses **Trivy** to scan Terraform files.
- Detects misconfigurations and vulnerabilities.
- Produces a detailed security report in Jenkins logs.
- Pipeline fails or raises warnings for insecure configurations.

#### Stage 3: Terraform Plan
- Runs `terraform plan`
- Displays infrastructure changes before deployment.

---

## Infrastructure Security Scanning (Trivy)

- Trivy scans Terraform code for:
  - Open SSH access
  - Insecure firewall rules
  - Missing encryption

### Initial Scan Result
- Security vulnerabilities detected (expected).
- Pipeline highlights risks clearly in Jenkins console.

---

## AI-Driven Security Remediation (Core Task)

### Workflow

1. Trivy vulnerability report is copied from Jenkins console.
2. Report is provided to AI with a security analysis prompt.
3. AI explains:
   - Security risks
   - Potential impact
   - Recommended fixes
4. Terraform code is updated based on AI suggestions.
5. Jenkins pipeline is re-run.
6. Trivy scan passes with **zero critical vulnerabilities**.

---

## Before & After Security Report

| State | Result |
|------|-------|
| Before AI Fix | Vulnerabilities detected |
| After AI Fix | No critical security issues |

---

## Cloud Deployment Status

- Terraform successfully provisions AWS infrastructure.
- EC2 instances are created and managed using Terraform.
- Elastic IP ensures stable public access.
- Application deployment on cloud infrastructure was attempted and validated during execution.

---

## Screenshots (To Be Added)

Include screenshots of:
- Initial failing Jenkins pipeline
- Trivy security vulnerability report
- Final successful Jenkins pipeline
- Application running on cloud public IP

---

## AI Usage Log (Mandatory)

### AI Prompt Used
Analyze this Trivy security scan report for Terraform.
Explain the risks and rewrite the Terraform code
to fix all critical security issues using best practices.


### AI Findings Summary
- Identified overly permissive SSH access
- Highlighted unnecessary public exposure
- Recommended least-privilege security rules

### Security Improvements
- SSH access restricted to specific IP
- Reduced attack surface
- Infrastructure hardened by default

---

## Repository Structure

├── app/
│ └── Node.js application
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── README.md
---

## Video Demonstration (To Be Added)

A **5–10 minute screen recording** demonstrating:
- Jenkins pipeline execution
- Trivy security scanning
- AI remediation explanation
- Terraform deployment
- Application access via public IP

**Video Link:** _Add here_

---

## Conclusion

This project demonstrates:

- DevSecOps best practices
- Secure infrastructure provisioning with Terraform
- CI/CD automation using Jenkins
- Infrastructure security scanning using Trivy
- Practical AI-driven security remediation

The assignment successfully integrates **automation, security, and AI** into a real-world DevSecOps workflow.

