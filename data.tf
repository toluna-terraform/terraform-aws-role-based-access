data "consul_keys" "api_key_arns" {
  key {
    name = "api_keys.json"
    path = "infra/${var.tribe}/api_key_arns/api_keys.json"
  }
}

data "consul_keys" "role_based_policy_rules" {
  key {
    name = "role_based_policy_rules.json"
    path = "terraform/tribe-net/role_based_policy_rules.json"
  }
}

data "aws_secretsmanager_secret_version" "key_to_send_in_header" {
  secret_id = local.api_key_arn_for_header
}

data "aws_secretsmanager_secret_version" "key_to_add_to_plan" {
  for_each = local.api_keys_to_add
  secret_id = each.value
}