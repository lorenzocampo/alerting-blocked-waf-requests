# Alerting AWS WAF blocked request

Terraform code that creates a solution to alert when a request is blocked in AWS WAF. It implements the following elements:

* **[Cloudwatch Log Group]**.
* **[Cloudwatch Metric Filter]**.
* **[Cloudwatch Alarm]**.
* **[SNS Topic]**.
* **[SNS Email Subscription]**.

[Cloudwatch Log Group]: https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html
[Cloudwatch Metric Filter]:    https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/MonitoringPolicyExamples.html
[Cloudwatch Alarm]:      https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/AlarmThatSendsEmail.html
[SNS Topic]:          https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html
[SNS Email Subscription]: https://docs.aws.amazon.com/sns/latest/dg/sns-create-subscribe-endpoint-to-topic.html


## How It Works

1. A Log Group contains the log streams of the AWS WAF.
2. A metric filter is created within that Log Group. When it finds the word 'BLOCK' it raises an alarm.
3. The alarm sends an event to the SNS topic.
4. The SNS topic notifies the subscribed emails.


## Usage

1. Clone the repository

    ```
    $ git clone git@github.com:lorenzocampo/alerting-blocked-waf-requests.git
    ```

2. Initialize a working directory containing Terraform configuration files:

    ```
    $ terraform init
    ```

3. Create an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure

    ```
    $ terraform plan
    ```

4. Executes the actions proposed in a Terraform plan

    ```
    $ terraform apply
    ```