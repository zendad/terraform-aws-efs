## Deploying AWS EFS with Terraform
This terraform code deploys an aws efs for use in ec2/docker/kubernetes

The following resources are defined in main.tf:

    1. aws_efs_file_system
    2. aws_efs_mount_target
    3. aws_security_group
    
    
### run the terraform

``` 
    terraform init -input=false 
    terraform plan -out=tfplanefs 
    terraform apply -input=false tfplanefs 
```
