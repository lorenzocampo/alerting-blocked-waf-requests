resource "aws_cloudwatch_log_group" "waf-cw-loggroup" {
  name = "/aws/waf/${var.project}/${var.region}"
}

resource "aws_cloudwatch_log_metric_filter" "waf-cw-logmetricfilter" {
  name           = "WAF_Blocked_Requests"
  pattern        = "BLOCK"
  log_group_name = aws_cloudwatch_log_group.waf-cw-loggroup.name
  metric_transformation {
    name      = "WAF_Blocked_Requests"
    namespace = "WAF_Blocked"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "waf_blocked_requests_alarm" {
  alarm_name                = "waf_blocked_requests_alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "WAF_Blocked_Requests"
  namespace                 = "WAF_Blocked"
  period                    = "300"
  statistic                 = "Sum"
  threshold                 = "1"
  alarm_description         = "This metric monitors waf blocked requests"
  treat_missing_data        = "notBreaching"
  alarm_actions             = [aws_sns_topic.waf_sns_topic.arn]
}