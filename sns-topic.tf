resource "aws_sns_topic" "waf_sns_topic" {
  name = "waf_sns_topic"
}

resource "aws_sns_topic_subscription" "email_sns_topic_subscription" {
  for_each = var.sns_email_list
  topic_arn = aws_sns_topic.waf_sns_topic.arn
  protocol  = "email"
  endpoint  = each.value
}