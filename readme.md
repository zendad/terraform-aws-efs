## Deploying AWS EFS with Terraform
This terraform code deploys an aws efs for use in ec2/docker/kubernetes

The following resources are defined in main.tf:
    aws_efs_file_system
    aws_efs_mount_target
    aws_security_group
    
    
### run the terraform

``` terraform init -input=false 
    terraform plan -out=tfplanefs 
    terraform apply -input=false tfplanefs ```