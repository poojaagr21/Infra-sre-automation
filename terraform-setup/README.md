// START GENAI
# Infra SRE Automation — Terraform EC2 Setup

Welcome! This project shows how I automated the creation of an AWS EC2 instance using Terraform.  
Below you'll find the steps I took, shell commands I used, common issues I hit, and the solutions that worked for me.

---

## 🗂️ Project Layout


// END GENAI
Infra-sre-automation/ ├── terraform-setup/ │ ├── main.tf │ ├── provider.tf │ ├── variables.tf │ ├── outputs.tf │ ├── output.tf │ └── ... ├── README.md └── InitialProjectSetup.md


---

## 🚀 Steps Performed

### 1. **Initialize Terraform Project**

- Created `main.tf`, `provider.tf`, `variables.tf`, and more.
- Set up the AWS provider and an EC2 resource referencing an AMI and instance type.

### 2. **Find Latest Amazon Linux 2 AMI**

```sh
aws ec2 describe-images \
  --owners amazon \
  --region us-west-2 \
  --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
  --query 'Images | sort_by(@, &CreationDate)[-1].ImageId' \
  --output text
Used the AMI ID from the output in my Terraform configuration.
3. Configure Variables
Used a variable for ami_id in Terraform.
Supplied the value via CLI or terraform.tfvars.
4. Initialize and Plan Terraform
# START GENAI
terraform init
terraform plan

# END GENAI
5. Dealt with Common Issues
InvalidAMIID.NotFound
Problem: AMI does not exist in the chosen region.
Solution: Ensured the AMI is from the same region as my provider block.
Instance type not Free Tier eligible
Problem: Instance type isn’t eligible for free tier.
Solution: Used t3.micro (or another eligible type found with
# START GENAI
aws ec2 describe-instance-types --filters "Name=free-tier-eligible,Values=true" --region us-west-2 --query "InstanceTypes[*].InstanceType"

# END GENAI
).
Git push/pull errors (non-fast-forward, divergent branches, etc.)
Problem: Couldn’t push due to branch conflicts.
Solution: Used
# START GENAI
git pull --rebase origin main

# END GENAI
to synchronize histories, resolved any conflicts, then pushed.
6. Apply Terraform Plan
# START GENAI
terraform apply

# END GENAI
Instance created successfully.
Noted the output, such as the public IP address.
7. Version Control with Git
Initialized the repo with git init.
Added .gitignore to exclude state and sensitive files.
Set up remote GitHub, handled branch renaming, and resolved push/pull issues.
💡 Common Commands
# START GENAI
# Terraform
terraform init
terraform plan
terraform apply
terraform destroy

# Git
git init
git add .
git commit -m "message"
git branch -m main
git remote add origin https://github.com/poojaagr21/Infra-sre-automation
git pull --rebase origin main
git push -u origin main

# END GENAI
🛠️ Lessons Learned / Troubleshooting
Always get your AMI ID in the same region you deploy to.
Use Free Tier eligible instance types when testing.
Synchronize local and remote Git branches before pushing.
Use .gitignore to protect sensitive and transient files.
If a folder doesn’t appear on GitHub, check for submodules or leftover .git directories.
GitHub now requires a Personal Access Token (PAT) for HTTPS git authentication.
🚦 Next Steps
Add more infrastructure (VPC, security groups, IAM, etc.)
Automate with CI/CD (GitHub Actions)
📚 References
Terraform AWS Provider Docs
AWS CLI Documentation
GitHub Personal Access Token Guide
