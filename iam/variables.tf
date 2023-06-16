# --- lambda/variables.tf ---
variable "prefix" {
  description = "A prefix used for all resources"
  type        = string
}

variable "project" {
  description = "A name of the project"
  type        = string
}

variable "environment" {
  description = "The environment to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  type        = string
  default     = "us-east-1"
}

## IAM Variables
variable "create_role" {
  description = "Controls whether IAM role for Lambda Function should be created"
  type        = bool
  default     = true
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = null
}

variable "policy_name" {
  description = "IAM policy name. It override the default value, which is the same as role_name"
  type        = string
  default     = null
}


variable "lambda_at_edge" {
  description = "Flag to indicate if the Lambda function is at the edge"
  type        = bool
  default     = false
}

variable "trusted_entities" {
  description = "List of additional trusted entities for assuming Lambda Function role (trust relationship)"
  type        = any
  default     = []
}

variable "assume_role_policy_statements" {
  description = "Map of dynamic policy statements for assuming Lambda Function role (trust relationship)"
  type        = any
  default     = {}
}

variable "role_description" {
  description = "Description for the IAM role"
  type        = string
  default     = null
}

variable "role_path" {
  description = "Path for the IAM role"
  type        = string
  default     = null
}

variable "role_force_detach_policies" {
  description = "Flag to force detach policies from the IAM role"
  type        = bool
  default     = true
}

variable "role_permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the IAM role used by Lambda Function"
  type        = string
  default     = null
}

variable "role_maximum_session_duration" {
  description = "Maximum session duration, in seconds, for the IAM role"
  type        = number
  default     = 3600
}

variable "role_tags" {
  description = "A map of tags to assign to IAM role"
  type        = map(string)
  default     = {}
}

variable "attach_policy_statements" {
  description = "Controls whether policy_statements should be added to IAM role for Lambda Function"
  type        = bool
  default     = false
}

variable "policy_statements" {
  description = "Map of dynamic policy statements to attach to Lambda Function role"
  type        = any
  default     = {}
}

variable "policy_path" {
  description = "Path of policies to that should be added to IAM role for Lambda Function"
  type        = string
  default     = null
}

variable "attach_policy_jsons" {
  description = "Controls whether policy_jsons should be added to IAM role for Lambda Function"
  type        = bool
  default     = false
}

variable "policy_jsons" {
  description = "List of additional policy documents as JSON to attach to Lambda Function role"
  type        = list(string)
  default     = []
}

variable "attach_policies" {
  description = "Controls whether list of policies should be added to IAM role for Lambda Function"
  type        = bool
  default     = false
}

variable "policies" {
  description = "List of policy statements ARN to attach to Lambda Function role"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}

variable "lambda_role" {
  description = " IAM role ARN attached to the Lambda Function. This governs both who / what can invoke your Lambda Function, as well as what resources our Lambda Function has access to. See Lambda Permission Model for more details."
  type        = string
  default     = ""
}

