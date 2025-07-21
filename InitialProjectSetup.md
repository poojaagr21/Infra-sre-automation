# Initial Project Setup and Tooling

**Date:** 2024-06-11

## Summary

This log documents the process of setting up the `Infra-sre-automation` project in AWS CloudShell, including Terraform installation, Git configuration, cloning the remote repository, and resolving related issues.

---

## Commands Used and Steps Performed

### 1. Checked if Terraform Was Installed
terraform -v
# Output: -bash: terraform: command not found

### 2. Downloaded and Installed Terraform
wget https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_amd64.zip
unzip terraform_1.8.5_linux_amd64.zip
mkdir -p ~/bin
mv terraform ~/bin/
echo 'export PATH=$PATH:~/bin' >> ~/.bashrc
source ~/.bashrc
terraform -v
# Verified installation with version output.

### 3. Cloned the Project Repository from GitHub
git clone https://github.com/poojaagr21/Infra-sre-automation.git
cd Infra-sre-automation
# Note: Received a warning about cloning an empty repository, which means there were no files yet.

### 4. Created and Added a README File
nano README.md
# (Pasted project description and saved the file)
git add README.md

### 5. Committed the README File
git commit -m "Add project README"
# Issue encountered:
# Author identity unknown
# Please tell me who you are.

### 6. Configured Git User Identity
git config --global user.name "Pooja Agrawal"
git config --global user.email "poojaagr21@gmail.com"
# Then successfully committed:
git commit -m "Add project README"

### 7. Pushed Changes to GitHub
git push origin main
# Issue encountered:
# remote: Permission to poojaagr21/Infra-sre-automation.git denied to poojaagr21.
# fatal: unable to access 'https://github.com/poojaagr21/Infra-sre-automation.git/': The requested URL returned error: 403
# Resolution:
# - Generated a Personal Access Token (PAT) on GitHub (https://github.com/settings/tokens)
# - Used the PAT as the password when prompted for GitHub authentication

---

## Issues Encountered & How They Were Fixed

1. Terraform Not Installed  
   *Issue:* `terraform: command not found`  
   *Fix:* Downloaded the binary, unzipped, moved to `~/bin`, updated the `PATH`, and verified installation.

2. Not a Git Repository Error  
   *Issue:* `fatal: not a git repository (or any parent up to mount point /home)`  
   *Fix:* Ensured to operate inside the cloned project directory.

3. Author Identity Unknown  
   *Issue:* Git required user identity.  
   *Fix:* Set with:  
     git config --global user.name "Pooja Agrawal"  
     git config --global user.email "poojaagr21@gmail.com"

4. GitHub Authentication Error (403)  
   *Issue:* Permission denied when pushing to GitHub.  
   *Fix:* Generated and used a Personal Access Token (PAT) instead of a password.

---

## Next Steps

