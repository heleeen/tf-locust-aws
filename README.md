# Locust for AWS

Create Locust instance on AWS by Python2.7 with Terraform

## Requirements

- AWS Access Key
- AWS Key pair name
- Terraform >= 0.12.5



## How to use

```
git clone <repo url>
cd locust_aws
```

write your config file.

```
terraform init
terraform apply

# check IP address on AWS Console
ssh ec2-user@<your ip address>
locust

# acccess on your brower to <your ip address>:8089
```
