variable "environment" {
  type        = string
  description = "This is the environment in which the load balancer will be running"

  validation {
    condition     = can(regex("^[a-z]+$", var.environment))
    error_message = "Environment must be a lowercase word"
  }
}

variable "bucket_names" {
  type        = list(string)
  description = "List of S3 bucket names to create Event Notifications for."

  validation {
    condition     = length(var.bucket_names) > 0
    error_message = "Bucket Names must contain atleast one bucket"
  }
}

variable "directory_path" {
  type        = string
  description = "The path to the directory containing the zip file that will be executed by lambda. Defaults to current directory."
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
  default     = {}
}

variable "lambda_timeout" {
  type        = number
  description = "Amount of time your Lambda Function has to run in seconds"
  default     = 120
}

variable "lambda_execution_policy_arn" {
  type        = string
  description = "The managed policy arn for lambda, for more info: https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html#permissions-executionrole-features"
  default     = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

variable "bucket_filter_prefix" {
  type        = string
  description = "Optional prefix to limit the notifications to objects with keys that start with matching characters"
  default     = ""
}

variable "bucket_filter_suffix" {
  type        = string
  description = "Optional suffix to limit the notifications to objects with keys that end with matching characters"
  default     = ""
}
