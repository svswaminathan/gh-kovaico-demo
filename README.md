# gh-kovaico-demo
Repository to showcase github actions for various workloads at kovaico meetup

## Concepts implemented

### GitHub actions workflow for a simple Terraform based Infrastructure as Code automation

For every PR against `master` branch below steps would be run

1. `terraform format`
2. `terraform init`
3. `terraform validate`
4. `terraform plan`
5. Share the individul step details to the PR comment

For `push` into `master` branch below steps would be run

1. `terraform format`
2. `terraform init`
3. `terraform validate`
4. `terraform plan`
5. `terraform apply`

### GitHub actions workflow for a simple dotnet webapi

Multi staged workflow that does the following

**Stage 1 -> Build**
1. `dotnet` build
2. `dotnet` publish

**Stage 2 -> Deploy to Dev Env**
1. Deploy to Azure Web App
2. Using environment specific secrets

**Stage 3 -> Deploy to Prod Env**
1. Deploy to Prod Azure web app
2. Approvals for Prod env
