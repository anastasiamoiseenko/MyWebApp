# Final Project for EPAM DevOps L1 course

## Automatic deployment of the webapp to a new Docker server
## using Jenkins-Docker-Terraform-Ansible

The following infrastructure is represented in this project:

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/V2Arch.png)

Therefore, here are the main goals of the project:
- Create the S3 bucket for tfstate remote storing
- Configure Jenkins Server and Jenkins Agent with appropriate Roles in the same VPC
- Build the Maven Project and create Docker Image
- Automate Terraform to create Web Server infrastructure with Jenkins
- Run Ansible playbook with Jenkins to install Docker and run the WebApp on thee new EC2 Instance

## 1. Create a S3 bucket for remote backend storing
This step can be done from local machine. Move to s3-backend folder and run terraform init/plan/apply. The "webapp-s3-backend" S3 bucket and DynamoDB table will be created.

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/s3_backend.png)

## 2. Install and Configure Jenkins Server and Jenkins Agent
### Jenkins Server required installations:
- Java
- Jenkins
- Maven

Required Plugins:
- SSH Agent Plugin
- SSH Build Agents Plugin (ex-Slaves)
- Git
- Ansible
- S3 Publisher

### Jenkins Agent required installations:
- Docker
- Terraform
- AWS CLI
- Python3
- Ansible

I have created both Jenkins Server and Jenkins Agent in AWS

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/1_instances.png)

## 3. Create Pipelines in Jenkins

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/11.jenkns_jobs.png)

These jobs represent the following flow:

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/V2Flow.png)

## 4. Create Infrastructure using Terraform in Jenkins

The "Terraform_Infrastructure" pipeline creates the infra for the Web-server:

- EC2 instance

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/6.created_tf_ans_instance.png)

- VPC

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/8.vpc.png)

- subnet

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/9.subnet.png)

- security group

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/10.security_group.png)

## 5. Jenkins run Ansible playbook to install Docker to the new server and run our built Docker Image with the WebApp

![Image alt](https://github.com/anastasiamoiseenko/MyWebApp/raw/main/screenshots/7.running_app_final.png)