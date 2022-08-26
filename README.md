# terraform-aws-lambda-s3-notification

This terraform modules provides creates needed to invoke a lambda function on s3 bucket notification events.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.lambda_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_role.iam_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.lambda_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_function_event_invoke_config.lambda_s3_invoke_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function_event_invoke_config) | resource |
| [aws_lambda_permission.allow_s3_invoke_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket_notification.push_to_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_notification) | resource |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_filter_prefix"></a> [bucket\_filter\_prefix](#input\_bucket\_filter\_prefix) | Optional prefix to limit the notifications to objects with keys that start with matching characters | `string` | `""` | no |
| <a name="input_bucket_filter_suffix"></a> [bucket\_filter\_suffix](#input\_bucket\_filter\_suffix) | Optional suffix to limit the notifications to objects with keys that end with matching characters | `string` | `""` | no |
| <a name="input_bucket_names"></a> [bucket\_names](#input\_bucket\_names) | List of S3 bucket names to create Event Notifications for. | `list(string)` | n/a | yes |
| <a name="input_directory_path"></a> [directory\_path](#input\_directory\_path) | The path to the directory containing the zip file that will be executed by lambda. Defaults to current directory. | `string` | `"."` | no |
| <a name="input_env_vars"></a> [env\_vars](#input\_env\_vars) | A map of env vars to be passed to lambda function | `map(string)` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | This is the environment in which the load balancer will be running | `string` | n/a | yes |
| <a name="input_file_name"></a> [file\_name](#input\_file\_name) | This is the name of the zip file that contains binary to be executed by the lambda | `string` | n/a | yes |
| <a name="input_lambda_execution_policy_arn"></a> [lambda\_execution\_policy\_arn](#input\_lambda\_execution\_policy\_arn) | The managed policy arn for lambda, for more info: https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html#permissions-executionrole-features | `string` | `"arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"` | no |
| <a name="input_lambda_timeout"></a> [lambda\_timeout](#input\_lambda\_timeout) | Amount of time your Lambda Function has to run in seconds | `number` | `120` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_iam_role_arn"></a> [aws\_iam\_role\_arn](#output\_aws\_iam\_role\_arn) | The ARN of the IAM Role created for the lambda function |
| <a name="output_aws_lambda_function_arn"></a> [aws\_lambda\_function\_arn](#output\_aws\_lambda\_function\_arn) | The ARN of the Lambda Function created |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Pre-requisite for PR

### Set up pre-commit

```shell
brew install pre-commit
brew install terraform-docs
brew install tflint

pre-commit install

#to run hooks against all files for first time after setup
pre-commit run --all-files
```

TF docs will be populated as part of pre-commit hook, you would need to commit the changes.

For further information on pre-commit, visit [this](https://pre-commit.com/#intro).
For further information on pre-commit-terraform, visit [this](https://github.com/antonbabenko/pre-commit-terraform).
