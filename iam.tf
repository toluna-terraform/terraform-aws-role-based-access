resource "aws_iam_policy" "secretsmanager_policy" {
  count = local.layer == "APP" ? 1 : 0
  name = "read-secrets-policy-${var.app_name}-${terraform.workspace}"
  
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : [
          "secretsmanager:GetSecretValue",
          "kms:DescribeKey",
          "kms:Decrypt"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })
}