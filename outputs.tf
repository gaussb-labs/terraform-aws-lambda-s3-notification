output "aws_iam_role_arn" {
  value       = aws_iam_role.iam_for_lambda.arn
  description = "The ARN of the IAM Role created for the lambda function"
}

output "aws_lambda_function_arn" {
  value       = aws_lambda_function.lambda_s3.arn
  description = "The ARN of the Lambda Function created"
}
