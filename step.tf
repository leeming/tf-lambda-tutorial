resource "aws_sfn_state_machine" "sfn_state_machine" {
  name     = "${local.environment_name}_deploy-migration"
  role_arn = "${aws_iam_role.lambda_exec_role.arn}"

  definition = <<EOF
{
  "Comment": "Example state machine for our db migration lambdas",
  "StartAt": "${aws_lambda_function.setup_rds.function_name}",
  "States": {
    "${aws_lambda_function.setup_rds.function_name}": {
      "Type": "Task",
      "Resource": "${aws_lambda_function.setup_rds.arn}",
      "Next": "..."
    },
    ...
    "${module.audit-lambda.function_name}": {
      "Type": "Task",
      "Resource": "${module.audit-lambda.arn}",
      "End": true
    }
  }
}
EOF
}
