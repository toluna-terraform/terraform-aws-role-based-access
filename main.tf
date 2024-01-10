locals {
  env_name                = split("-", terraform.workspace)[0]
  api_key_arn_for_header  = jsondecode(data.consul_keys.api_key_arns.var["api_keys.json"])[upper(var.env_type)][var.app_role]
  env_type                = var.pipeline_type == "dev" ? "DEV" : upper(var.env_type)
  api_key_arns     = jsondecode(data.consul_keys.api_key_arns.var["api_keys.json"])
  role_based_policy_rules = jsondecode(("${data.consul_keys.role_based_policy_rules.var}")["role_based_policy_rules.json"])[local.env_type]
  dev_role_based_policy_rules = jsondecode(("${data.consul_keys.role_based_policy_rules.var}")["role_based_policy_rules.json"])["DEV"]
  main_api_keys_to_add = merge([ for env in local.role_based_policy_rules.allowed_envs : 
                      { for role in local.role_based_policy_rules.roles[var.app_role]:
                        "${env}-${role}" => local.api_key_arns[env][role]
                      }
                    ]...)
  dev_api_keys_to_add = merge([ for env in local.dev_role_based_policy_rules.allowed_envs : 
                    { for role in local.dev_role_based_policy_rules.roles[var.app_role]:
                      "${env}-${role}" => local.api_key_arns[env][role]
                    }
                  ]...)
  api_keys_to_add = local.env_type == "non-prod" ? merge(local.dev_api_keys_to_add,local.main_api_keys_to_add) : local.main_api_keys_to_add
  layer = startswith(terraform.workspace, "shared") ? "SHARED" : startswith(terraform.workspace, "data") ? "DATA" : "APP"
}

