# terraform-aws-lambda-s3-notification

This terraform modules provides creates needed to invoke a lambda function on s3 bucket notification events.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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
