# terraform-project

*Steps to replicate this project*

1. Create an IAM, and set enviroment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
2. Create `main.tf` with [starter code](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build)
3. Find Linux distro `aws ec2 describe-images --region us-east-1 --owners amazon --filters "Name=name,Values=*linux*" "Name=architecture,Values=x86_64,i386"`
4. `terraform init; terraform validate; terraform apply`
5. To print IP address: `terraform show`
6. Add bash script to install Nginx
7. Create secutiy group to allow ingress
8. Output IP