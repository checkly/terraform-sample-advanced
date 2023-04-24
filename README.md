# Terraform Demo Advanced

A sample Terraform setup for Checkly. When applied, will provision:
- 7 browser checks
- 6 (placeholder) API checks
- 3 groups
- 2 alert channels
- 1 maintenance window
- 1 dashboard

Scripts are found in `/critical-user-flows`. With the current configuration, a browser check will be created for each spec in `/critical-user-flows`.

## Usage

1. [Create an account](https://app.checklyhq.com/signup) on Checkly.
2. Run `terraform init`.
3. Run `terraform apply`.
4. When prompted, enter your [Checkly API key](https://app.checklyhq.com/settings/user/api-keys)[account ID](https://app.checklyhq.com/settings/account/general) and a checkly_dashboard_url for your [Checkly Public dashboard](https://www.checklyhq.com/docs/terraform-provider/dashboards/).  
5. The checkly_dashboard_url aids in our creation of a custom dashboard that will display the health of our checks. 

You can export these values to environment variables, respectively `TF_VAR_checkly_api_key`, `TF_VAR_checkly_account_id` and `TF_VAR_checkly_dashboard_url` to skip this step.

## Resources

For more information, see the [Checkly Terraform Provider docs](https://www.checklyhq.com/docs/terraform-provider/).