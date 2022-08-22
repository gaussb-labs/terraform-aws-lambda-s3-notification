variable "environment" {
  type        = string
  description = "This is the environment in which the load balancer will be running"
}

variable "bucket_names" {
  type        = list(string)
  description = "List of S3 bucket names to create Event Notifications for."
  default     = []
}

variable "file_path" {
  type        = string
  description = "This is the path to the folder containing the zip file that will be executed by lambda"
  default     = "."
}

variable "file_name" {
  type        = string
  description = "This is the name of the zip file that contains binary to be executed by the lambda"

  validation {
    condition     = can(regex("^[a-zA-Z0-9_]+.(zip)$", var.file_name))
    error_message = "The file name must be a zip file with alpha numeric character and can contain _"
  }
}

variable "env_vars" {
  type        = map(string)
  description = "A map of env vars to be passed to lambda function"
}

variable "lambda_timeout" {
  type        = number
  default     = 120
  description = "Amount of time your Lambda Function has to run in seconds"
}

variable "lambda_execution_policy_arn" {
  type        = string
  description = "The managed policy arn for lambda, for more info: https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html#permissions-executionrole-features"
  default     = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
