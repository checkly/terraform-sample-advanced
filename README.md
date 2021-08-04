# Terraform Basic Sample

A sample Terraform setup for Checkly. When applied, will provision:
- 3 browser checks
- 6 (placeholder) API checks
- 3 groups
- 2 alert channels

Scripts for browser checks are found in `/scripts`. With the current configuration, a browser check will be created for each script in `/scripts`.

## Usage

1. [Create an account](https://app.checklyhq.com/signup) on Checkly.
2. Run `terraform init`.
3. Run `terraform apply`.
4. When prompted, enter your [Checkly API key](https://app.checklyhq.com/account/api-keys).