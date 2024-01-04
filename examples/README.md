<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_consul"></a> [consul](#provider\_consul) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.secretsmanager_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_secretsmanager_secret_version.key_to_add_to_plan](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [aws_secretsmanager_secret_version.key_to_send_in_header](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |
| [consul_keys.api_key_arns](https://registry.terraform.io/providers/hashicorp/consul/latest/docs/data-sources/keys) | data source |
| [consul_keys.role_based_policy_rules](https://registry.terraform.io/providers/hashicorp/consul/latest/docs/data-sources/keys) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | n/a | `string` | n/a | yes |
| <a name="input_app_role"></a> [app\_role](#input\_app\_role) | n/a | `string` | n/a | yes |
| <a name="input_env_type"></a> [env\_type](#input\_env\_type) | n/a | `string` | n/a | yes |
| <a name="input_pipeline_type"></a> [pipeline\_type](#input\_pipeline\_type) | n/a | `string` | n/a | yes |
| <a name="input_tribe"></a> [tribe](#input\_tribe) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_key_arn_for_header"></a> [api\_key\_arn\_for\_header](#output\_api\_key\_arn\_for\_header) | n/a |
| <a name="output_api_keys_to_add"></a> [api\_keys\_to\_add](#output\_api\_keys\_to\_add) | n/a |
| <a name="output_key_to_add_to_plan"></a> [key\_to\_add\_to\_plan](#output\_key\_to\_add\_to\_plan) | n/a |
| <a name="output_key_to_send_in_header"></a> [key\_to\_send\_in\_header](#output\_key\_to\_send\_in\_header) | n/a |
| <a name="output_secretsmanager_policy"></a> [secretsmanager\_policy](#output\_secretsmanager\_policy) | n/a |
<!-- END_TF_DOCS -->