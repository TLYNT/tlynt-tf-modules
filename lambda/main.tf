# --- lambda/main.tf ---
terraform {
  required_version = "~> 1"

  required_providers {
    aws = "4.49.0"
  }
}

# ------------------------------------------------------------------------------
# CREATE S3 OBJECT
# ------------------------------------------------------------------------------

resource "aws_s3_object" "s3_auth_lambda" {
  bucket       = "${var.prefix}-${var.env}-${var.lambda_bucket}"
  key          = "lambda/${var.lambda_name}.zip"
  source       = "${var.source_path}/${var.lambda_name}.zip"
  content_type = "application/zip"

  etag = filesha1("${var.source_path}/${var.lambda_name}.zip")
}

# ------------------------------------------------------------------------------
# CREATE LAMBDA FUNCTION
# ------------------------------------------------------------------------------

resource "aws_lambda_function" "lambda" {
  function_name     = "${var.prefix}-${var.env}-${var.lambda_name}"
  architectures     = var.architectures
  memory_size       = var.lambda_memory
  s3_bucket         = aws_s3_object.s3_auth_lambda.bucket
  s3_key            = aws_s3_object.s3_auth_lambda.key
  s3_object_version = aws_s3_object.s3_auth_lambda.version_id
  runtime           = var.runtime
  timeout           = var.timeout
  handler           = var.handler_name
  role              = aws_iam_role.lambda.arn

  dynamic "vpc_config" {
    for_each = var.subnets != null && var.security_group_ids != null && var.default_security_group_id != null ? [1] : []

    content {
      security_group_ids = length(var.security_group_ids) > 0 ? data.aws_ssm_parameter.sg_id[*].value : split(",", var.default_security_group_id)
      subnet_ids         = split(",", data.aws_ssm_parameter.lambda_subnets.value)
    }
  }

  environment {
    variables = local.env_vars
  }

  ## This layer is used to enable enhance monitoring feature on lambda as this is extention loaded as layer its not flag
  ## in order to enable this extention we just need to add layer. 
  ## Here aws account id used is to load extension from aws account so dont replace it
  ## Refer here: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Lambda-Insights-extension-versionsx86-64.html

  layers = [
    "arn:aws:lambda:${var.region}:580247275435:layer:LambdaInsightsExtension-Arm64:2"
  ]

  tags = {
    Name        = "${var.prefix}-${var.env}-${var.lambda_name}"
    Project     = "${var.project}"
    Environment = "${var.env}"
    Region      = "${var.region}"
    Program     = "${var.program}"
  }
}

# ------------------------------------------------------------------------------
# ASSIGN PERMISSION TO API GATEWAY 
# ------------------------------------------------------------------------------

resource "aws_lambda_permission" "api" {
  statement_id  = "AllowAPIGWLambdaInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${data.aws_ssm_parameter.apigw_exec_arn.value}/*/*/*"
}

# ------------------------------------------------------------------------------
# LAMBDA LOG RETENTION
# ------------------------------------------------------------------------------

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${var.lambda_name}"
  retention_in_days = var.logs_retention

  tags = {
    Project = "${var.project}"
    program = "${var.program}"
  }
}
