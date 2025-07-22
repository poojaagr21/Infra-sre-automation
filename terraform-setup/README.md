// START GENAI
# Infra SRE Automation — Terraform EC2 Project

This project demonstrates how to automate the provisioning of an AWS EC2 instance using Terraform.  
All steps, commands, issues encountered, and their solutions are documented below.

---

## 🗂️ Project Structure


// END GENAI
Infra-sre-automation/ ├── terraform-setup/ │ ├── main.tf │ ├── provider.tf │ ├── variables.tf │ ├── outputs.tf │ ├── output.tf │ └── ... ├── README.md └── InitialProjectSetup.md


---

## 🚀 Steps Performed

### 1. **Initialize Terraform Project**

- Created `main.tf`, `provider.tf`, `variables.tf`, `outputs.tf`, etc.
- Added AWS provider and an EC2 resource referencing an AMI and instance type.

---

### 2. **Find Latest Amazon Linux 2 AMI**

**Command:**
```sh
aws ec2 describe-images \
  --owners amazon \
  --region us-west-2 \
  --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
  --query 'Images | sort_by(@, &CreationDate)[-1].ImageId' \
  --output text
Sample Output:

ami-0abcdef1234567890
Recorded the AMI ID for use in Terraform.
3. Configure Variables
Used a variable for ami_id in Terraform:
// START GENAI
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

// END GENAI
Provided the value in terraform.tfvars or via the CLI.
4. Initialize and Plan Terraform
Commands:

# START GENAI
terraform init
terraform plan

# END GENAI
Sample Output:

Terraform has been successfully initialized!
...
Plan: 1 to add, 0 to change, 0 to destroy.
5. Dealt with Common Issues
InvalidAMIID.NotFound
Error:
Error: Error launching source instance: InvalidAMIID.NotFound: The image id '[ami-0abcdef1234567890]' does not exist
Solution:
Ensure your AMI ID is from the same region as your AWS provider block.
Instance type not Free Tier eligible
Error:
The requested instance type is not eligible for the free tier.
Solution:
Use t3.micro or find eligible types with:
# START GENAI
aws ec2 describe-instance-types --filters "Name=free-tier-eligible,Values=true" --region us-west-2 --query "InstanceTypes[*].InstanceType"

# END GENAI
Git push/pull errors (non-fast-forward, divergent branches, etc.)
Error:
error: failed to push some refs to ...
hint: Updates were rejected because the tip of your current branch is behind its remote counterpart.
Solution:
# START GENAI
git pull --rebase origin main
# Resolve any conflicts if prompted
git push -u origin main

# END GENAI
6. Apply Terraform Plan
Command:

# START GENAI
terraform apply

# END GENAI
Sample Output:

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

instance_public_ip = "54.123.45.67"
7. Version Control with Git
Initialized repo:
# START GENAI
git init

# END GENAI
Added .gitignore to exclude state and sensitive files.
Pushed to GitHub:
# START GENAI
git add .
git commit -m "Initial commit"
git branch -m main
git remote add origin https://github.com/poojaagr21/Infra-sre-automation
git push -u origin main

# END GENAI
💻 Common Commands
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
🛠️ Troubleshooting & Lessons Learned
Always use an AMI from the correct AWS region.
Choose a Free Tier-eligible instance type for testing.
Synchronize local and remote Git branches before pushing.
Use .gitignore to protect state files and sensitive data.
If a folder doesn't appear on GitHub, check for submodules or .gitignore issues.
GitHub now requires a personal access token (PAT) for HTTPS authentication.
🔮 Next Steps
Add more infrastructure (VPC, security groups, IAM, etc.)
Automate deployments using CI/CD (GitHub Actions, etc.)
Add tests and infrastructure as code best practices.
📚 References
Terraform AWS Provider Docs
GitHub Personal Access Token Guide
AWS CLI Documentation
