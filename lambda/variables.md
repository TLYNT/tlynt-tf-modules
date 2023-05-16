<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.49.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.rule](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.warm_lambda](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_log_group.lambda_logs](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.this](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_iam_policy.additional_inline](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/iam_policy) | resource |
| [aws_iam_policy.additional_jsons](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/iam_policy) | resource |
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.additional_inline](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.additional_jsons](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.additional_many](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.api](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/lambda_permission) | resource |
| [aws_lambda_permission.cloudwatch_warmer_permission](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/lambda_permission) | resource |
| [aws_s3_object.s3_auth_lambda](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/resources/s3_object) | resource |
| [aws_iam_policy_document.additional_inline](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_parameter.apigw_exec_arn](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.default_sg_id](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.lambda_subnets](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.sg_id](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.sns_topic_arn](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.ssm_environment_variables](https://registry.terraform.io/providers/hashicorp/aws/4.49.0/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Aws account id | `string` | n/a | yes |
| <a name="input_apigw_execution_arn"></a> [apigw\_execution\_arn](#input\_apigw\_execution\_arn) | API Gateway execution arn | `string` | `"apigw/GW_EXEC_ARN"` | no |
| <a name="input_architectures"></a> [architectures](#input\_architectures) | Lambda function architecture | `list(string)` | <pre>[<br>  "arm64"<br>]</pre> | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | Weather to create IAM role | `string` | n/a | yes |
| <a name="input_default_security_group_id"></a> [default\_security\_group\_id](#input\_default\_security\_group\_id) | The ID of the security group created by default on VPC creation | `string` | `"vpc/DEFAULT_NSG_ID"` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the rule | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | The environment to deploy to | `string` | n/a | yes |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | A map that defines environment variables for the Lambda Function. | `map(string)` | `{}` | no |
| <a name="input_handler_name"></a> [handler\_name](#input\_handler\_name) | Lambda function handler name | `string` | n/a | yes |
| <a name="input_lambda_bucket"></a> [lambda\_bucket](#input\_lambda\_bucket) | S3 bucket on which lambda code reside | `string` | n/a | yes |
| <a name="input_lambda_memory"></a> [lambda\_memory](#input\_lambda\_memory) | Required Memory for Lambda function | `number` | `128` | no |
| <a name="input_lambda_name"></a> [lambda\_name](#input\_lambda\_name) | Lambda function name | `string` | n/a | yes |
| <a name="input_lambda_warmer_rule_name"></a> [lambda\_warmer\_rule\_name](#input\_lambda\_warmer\_rule\_name) | Lambda warmer event bridge rule name | `string` | n/a | yes |
| <a name="input_logs_retention"></a> [logs\_retention](#input\_logs\_retention) | Specifies the number of days you want to retain log events in the specified log group | `number` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A prefix used for all resources | `string` | n/a | yes |
| <a name="input_program"></a> [program](#input\_program) | A name of the program | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | A name of the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to deploy to | `string` | n/a | yes |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Lambda function runtime environment | `string` | n/a | yes |
| <a name="input_schedule_expression"></a> [schedule\_expression](#input\_schedule\_expression) | The scheduling expression | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | List of VPC Security Group ids | `list(string)` | `[]` | no |
| <a name="input_source_path"></a> [source\_path](#input\_source\_path) | Lambda function source path | `string` | n/a | yes |
| <a name="input_ssm_environment_variables"></a> [ssm\_environment\_variables](#input\_ssm\_environment\_variables) | map of strings containing sensitive SSM parameters; to be passed in as lambda environment variables | `map(string)` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of VPC subnets | `string` | `"vpc/LAMBDA_SUBNETS_IDS"` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Amount of time your Lambda Function has to run in seconds | `number` | `3` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Lambda ARN |
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | Name of the Lambda function. |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | Lambda Invoke ARN |
<!-- END_TF_DOCS -->