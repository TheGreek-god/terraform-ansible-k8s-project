# AKS Deployment using Terraform and Ansible  

## 📋 Project Overview

This project demonstrates how to provision a Kubernetes cluster on Microsoft Azure using Terraform and deploy applications using Ansible.


## Prerequisites

- Terraform installed

- Ansible installed

- Azure CLI installed and authenticated

- WSL (Windows Subsystem for Linux) recommended if running Ansible on Windows  


# 🏗️ Steps
 ## 1️⃣ Terraform: Provision AKS Cluster

**1 Navigate to the Terraform directory:**

- cd terraform-ansible-k8s-project/terraform

**2 Initialize Terraform:**

- terraform init

**3 Apply Terraform configuration:** 

- terraform apply -auto-approve  

## 2️⃣ Configure Ansible for AKS  

**1 Change directory into the Ansible folder:**

- cd ../ansible

**2 Add your Azure service principal credentials**  

**3 Export the credentials as environment variables:**

- export AZURE_CLIENT_ID= "your-client-id"  
- export AZURE_SECRET= "your-client-secret"  
- exportAZURE_SUBSCRIPTION_ID= "your-subscription-id"  
- exportAZURE_TENANT= "your-tenant-id"


**4 Connect to your AKS cluster:**

- az aks get-credentials --resource-group <RESOURCE_GROUP_NAME> --name <CLUSTER_NAME>


**(Optional) Verify cluster access:**

- kubectl get nodes

## 3️⃣ Run Ansible Playbooks

**1 Execute the main playbook:**

- ansible-playbook ./ansible/playbook.main.yaml -vvv


**1 Verify resources in AKS:**

- kubectl get pods
- kubectl get svc


**You can also check your AKS cluster via the Azure Portal.**


## ⚠️ Security Note:  

 Never commit sensitive files like your service principal credentials or Terraform state files (*.tfstate) to any public repository. Terraform variable files (terraform.tfvars) may also contain sensitive data. Only use placeholders in shared repos.



