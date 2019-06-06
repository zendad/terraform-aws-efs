## Deploying AWS EFS with Terraform

The AWS Elastic Filesystem (EFS) gives you an NFSv4-mountable file system with almost unlimited storage capacity.iThis terraform code deploys an aws efs for use in ec2/docker/kubernetes.
A mount target will be difened to allow ec2/docker/kubernetes resources to mount the EFS volume using NFS. Security groups will be open on port 2049 to allow access to the EFS volume.

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

After running the terraform commands and entering the required variables, an EFS file system will be created for mounting on or use in ec2/docker/kubernetes.
