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
