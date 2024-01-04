output "key_to_send_in_header" {
  value = data.aws_secretsmanager_secret_version.key_to_send_in_header.secret_string
  sensitive = true
}

output "api_key_arn_for_header" {
    value  = local.api_key_arn_for_header
    sensitive = true
}

output "key_to_add_to_plan" {
  value = [for k, v in data.aws_secretsmanager_secret_version.key_to_add_to_plan : v.secret_string]
  sensitive = true
}

output "secretsmanager_policy" {
    value = local.layer == "APP" ? aws_iam_policy.secretsmanager_policy[0].arn : ""
    sensitive = true
}

output "api_keys_to_add" {
  value = local.api_keys_to_add
}