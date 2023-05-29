resource "aws_cloudwatch_metric_alarm" "this" {

  alarm_name        = "${var.prefix}-${var.env}-${var.lambda_name}-MaxMemory-Alarm"
  alarm_description = "Lambdas max memory utilization"
  alarm_actions     = [data.aws_ssm_parameter.sns_topic_arn.value]

  metric_name = "memory_utilization"
  namespace   = "LambdaInsights"
  period      = "900"
  statistic   = "Average"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "4"
  threshold           = "75"
  datapoints_to_alarm = "3"
  treat_missing_data  = "missing"

  dimensions = {
    function_name = "${var.prefix}-${var.env}-${var.lambda_name}"
  }

}

