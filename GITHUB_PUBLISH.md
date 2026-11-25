# Publish to GitHub
Create an empty repository named `aws-production-support` under `sanjeev0407`.
```powershell
git init
git add .
git status
git commit -m "Add AWS production support and troubleshooting portfolio"
git branch -M main
git remote add origin https://github.com/sanjeev0407/aws-production-support.git
git push -u origin main
```
If remote exists, inspect `git remote -v`. Never commit credentials, `.env`, private keys, Terraform state, production dumps or unredacted logs.
