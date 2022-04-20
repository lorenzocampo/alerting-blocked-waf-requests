variable "region" {
  type        = string
  description = "region where the resources will be created"
}

variable "project" {
  type        = string
  description = "project code to be used for resources naming"
}

variable "sns_email_list" {
  type = map
  description = "list of emails that will receive the alarm notifications"
}