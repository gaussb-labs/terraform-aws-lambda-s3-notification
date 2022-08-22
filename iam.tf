locals {
  cloudwatch_log_arn = "arn:aws:logs:${data.aws_region.current.name}:*:*"
  bucket_arns        = [for bucket in toset(var.bucket_names) : "arn:aws:s3:::${bucket}/*"]
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_${local.lambda_function_name}"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "lambda.amazonaws.com"
        },
        "Effect" : "Allow",
      }
    ]
  })
}

resource "aws_iam_role_policy" "logs" {
  name = "${local.lambda_function_name}_logs"
  role = aws_iam_role.iam_for_lambda.name
  policy = jsonencode({
    "Statement" : [
      {
        "Action" : [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents",
        ],
        "Effect" : "Allow",
        "Resource" : local.cloudwatch_log_arn,
      },
      {
        "Action" : [
          "s3:GetObject",
        ],
        "Effect" : "Allow",
        "Resource" : local.bucket_arns,
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = var.lambda_execution_policy_arn
}
