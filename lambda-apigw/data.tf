data "aws_ssm_parameter" "ssm_environment_variables" {
  for_each = { for k, v in var.ssm_environment_variables : k => v }
  name     = "/${var.prefix}/${var.env}/${each.value}"
}

locals {
  ssm_environment_variables = { for k, v in data.aws_ssm_parameter.ssm_environment_variables : k => v.value }
  environment_variables     = { for k, v in var.environment_variables : k => v }
  env_vars                  = merge(local.environment_variables, local.ssm_environment_variables)
}

data "aws_ssm_parameter" "apigw_exec_arn" {
  name = "/${var.prefix}/${var.env}/${var.apigw_execution_arn}"
}

data "aws_ssm_parameter" "default_sg_id" {
  count = var.default_security_group_id != null ? 1 : 0
  name  = "/${var.prefix}/${var.env}/${var.default_security_group_id}"
}

data "aws_ssm_parameter" "lambda_subnets" {
  count = var.subnets != null ? 1 : 0
  name  = "/${var.prefix}/${var.env}/${var.subnets}"
}

data "aws_ssm_parameter" "sg_id" {
  count           = var.security_group_ids != null ? length(var.security_group_ids) : 0
  name            = "/${var.prefix}/${var.env}/${var.security_group_ids[count.index]}"
  with_decryption = true
}

data "aws_ssm_parameter" "sns_topic_arn" {
  name = "/${var.prefix}/${var.env}/monitoring/SLACK_SNS_TOPIC"
}

