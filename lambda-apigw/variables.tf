variable "apigw_execution_arn" {
  description = "API Gateway execution arn"
  type        = string
  default     = "apigw/GW_EXEC_ARN"
}

variable "architectures" {
  description = "Lambda function architecture"
  type        = list(string)
  default     = ["arm64"]
}

variable "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  type        = string
  default     = "vpc/DEFAULT_NSG_ID"
}

variable "description" {
  description = "Description of your Lambda Function (or Layer)"
  type        = string
  default     = ""
}

variable "env" {
  description = "The environment to deploy to"
  type        = string
}

variable "environment_variables" {
  description = "A map that defines environment variables for the Lambda Function."
  type        = map(string)
  default     = {}
}

variable "handler_name" {
  description = "Lambda function handler name"
  type        = string
}

variable "lambda_bucket" {
  description = "S3 bucket on which lambda code reside"
  type        = string
}

variable "lambda_memory" {
  description = "Required Memory for Lambda function"
  type        = number
  default     = 128
}

variable "lambda_name" {
  description = "Lambda function name"
  type        = string
}

variable "lambda_role" {
  description = "IAM role ARN attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details."
  type        = string
  default     = ""
}

variable "lambda_warmer_rule_desc" {
  description = "The description of the lambda warmer rule"
  type        = string
}

variable "lambda_warmer_rule_name" {
  description = "Lambda warmer event bridge rule name"
  type        = string
}

variable "lambda_warmer_rule_schedule" {
  description = "The scheduling expression for lambda warmer rule"
  type        = string
}

variable "logs_retention" {
  description = "Specifies the number of days you want to retain log events in the specified log group"
  type        = number
  default     = null
}

variable "prefix" {
  description = "A prefix used for all resources"
  type        = string
}

variable "program" {
  description = "A name of the program"
  type        = string
}

variable "project" {
  description = "A name of the project"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  type        = string
}

variable "runtime" {
  description = "Lambda function runtime environment"
  type        = string
}

variable "security_group_ids" {
  description = "List of VPC Security Group ids"
  type        = list(string)
  default     = []
}

variable "source_path" {
  description = "Lambda function source path"
  type        = string
}

variable "ssm_environment_variables" {
  description = "map of strings containing sensitive SSM parameters; to be passed in as lambda environment variables"
  type        = map(string)
}

variable "subnets" {
  description = "List of VPC subnets"
  type        = string
  default     = "vpc/LAMBDA_SUBNETS_IDS"
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "timeout" {
  description = "Amount of duration until which the lambda will be terminated if it hasn't returned"
  default     = 3
}

