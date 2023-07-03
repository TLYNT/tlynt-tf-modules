# --- lambda/outputs.tf ---
output "lambda_role_arn" {
  description = "The ARN of the IAM role created for the Lambda Function"
  value       = try(aws_iam_role.lambda[0].arn, "")
}

output "role_arn" {
  description = "The ARN of the IAM role created"
  value       = try(aws_iam_role.lambda[0].arn, "")
}

output "lambda_role_name" {
  description = "The name of the IAM role created for the Lambda Function"
  value       = try(aws_iam_role.lambda[0].name, "")
}

output "lambda_role_unique_id" {
  description = "The unique id of the IAM role created for the Lambda Function"
  value       = try(aws_iam_role.lambda[0].unique_id, "")
}

