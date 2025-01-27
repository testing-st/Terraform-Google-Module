# Google Cloud Billing Budget Setup using Terraform

## Overview

This repository contains Terraform configuration files for creating and managing Google Cloud Billing Budgets. These budgets allow you to monitor and control your cloud spending by setting budget thresholds and notification rules.

## Features

- Automated creation of Google Cloud billing budgets.
- Configurable budget amount and filtering options.
- Dynamic thresholds for notifications.
- Integration with Google Monitoring Notification Channels.
- Support for custom periods and calendar periods for budget tracking.

## Prerequisites

Before using this module, ensure the following:

- **Google Cloud Account**: Active Google Cloud account with billing enabled.
- **Terraform Installed**: Install Terraform from [Terraform's official website](https://www.terraform.io/downloads.html).
- **Google Cloud SDK**: Install and configure the Google Cloud SDK ([instructions](https://cloud.google.com/sdk/docs/install)).
- **IAM Permissions**: Ensure you have permissions:
  - `roles/billing.user`
  - `roles/monitoring.editor`
  - `roles/pubsub.editor`

## Inputs

| Name                     | Description                                                   | Type     | Default        | Required |
|--------------------------|---------------------------------------------------------------|----------|----------------|----------|
| `specified_amount`       | List of specified amounts for the budget.                     | `list`   | `[]`           | No       |
| `last_period_amount`     | Use the last period's spending as the budget amount.          | `bool`   | `false`        | No       |
| `billing_account_id`     | The ID of the billing account associated with the budget.     | `string` | n/a            | Yes      |
| `budget_name`            | The display name of the budget.                               | `string` | n/a            | Yes      |
| `budget_filter`          | Filtering options for the budget (e.g., projects, services).  | `list`   | `[]`           | No       |
| `threshold_rules`        | List of threshold rules for budget notifications.             | `list`   | `[]`           | No       |
| `all_updates_rule`       | Rules for updates to trigger notifications.                   | `list`   | `[]`           | No       |
| `ownership_scope`        | The scope of the budget ownership.                            | `string` | n/a            | Yes      |
| `budget_notify_name`     | Display name for the notification channel.                    | `string` | n/a            | Yes      |
| `email_address`          | Email address for budget notifications.                       | `string` | n/a            | Yes      |
 
## Outputs

| Name                          | Description                                |
|-------------------------------|--------------------------------------------|
| `budget_id`                   | The unique ID of the created budget.       |
| `notification_channel_id`     | The ID of the notification channel.        |

## Contacts

For questions or support, please contact:

- **Project Maintainer**: [Your Name or Team](mailto:support@example.com)
- **Issue Tracker**: [GitHub Issues](https://github.com/your-repo/issues)

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push the branch (`git push origin feature-name`).
5. Open a pull request.

For major changes, please open an issue first to discuss your ideas.

---

Thank you for using this Terraform module! Feedback and contributions are appreciated.
