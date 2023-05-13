# --- lambda/warmer.tf ---
resource "aws_cloudwatch_event_rule" "rule" {
  name                = "${var.prefix}-${var.lambda_name}-${var.env}-${var.lambda_warmer_rule_name}"
  description         = var.description
  schedule_expression = var.schedule_expression

  tags = {
    Project     = "${var.prefix}"
    Environment = "${var.env}"
    Region      = "${var.region}"
  }
}

resource "aws_cloudwatch_event_target" "warm_lambda" {

  rule      = aws_cloudwatch_event_rule.rule.name
  target_id = "${var.prefix}-${var.env}-${var.lambda_name}-target"
  arn       = aws_lambda_function.lambda.arn
  input     = <<JSON
  { "warmer": "true" }
  JSON
}

resource "aws_lambda_permission" "cloudwatch_warmer_permission" {

  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.rule.arn

}