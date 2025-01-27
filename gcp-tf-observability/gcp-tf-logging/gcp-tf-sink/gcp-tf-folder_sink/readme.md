# Google Logging Folder Sink Setup using Terraform

## Overview

This repository contains Terraform configuration files for managing Google Cloud Logging Folder Sinks. This module allows you to create logging sinks at the folder level, enabling the routing of logs to destinations such as BigQuery, Cloud Storage, or Pub/Sub, with advanced configurations like exclusions and filter settings.

## Features

- Supports creation of logging sinks for folder-level configurations.
- Configurable destinations for logs (e.g., BigQuery, Cloud Storage, Pub/Sub).
- Flexible log filtering to include or exclude specific logs.
- Dynamic configuration for BigQuery options, such as partitioned tables.
- Ability to manage exclusions and their details (e.g., name, description, filter).

## Prerequisites

Before using this module, ensure the following:

- **Google Cloud Account**: Active Google Cloud account with project-level access.
- **Terraform Installed**: Install Terraform from [Terraform's official website](https://www.terraform.io/downloads.html).
- **Google Cloud SDK**: Install and configure the Google Cloud SDK ([instructions](https://cloud.google.com/sdk/docs/install)).
- **IAM Permissions**: Ensure you have the necessary permissions:
  - `roles/logging.admin` (for managing logs and sinks).
  - `roles/storage.admin` (if using Cloud Storage as a destination).
  - `roles/bigquery.dataEditor` (if using BigQuery as a destination).

## Inputs

| Name                           | Description                                                                 | Type     | Default | Required |
|---------------------------------|----------------------------------------------------------------------------|----------|---------|----------|
| `name`                          | The name of the logging sink.                                              | `string` | n/a     | Yes      |
| `folder_id`                     | The ID of the folder where the logging sink will be created.               | `string` | n/a     | Yes      |
| `destination`                   | The destination for logs (e.g., `bigquery`, `cloud-storage`, `pubsub`).    | `string` | n/a     | Yes      |
| `filter`                        | The filter expression for the logs to include/exclude.                     | `string` | n/a     | Yes      |
| `description`                   | Description of the logging sink.                                           | `string` | `""`    | No       |
| `disabled`                      | Whether the sink is disabled.                                              | `bool`   | `false` | No       |
| `include_children`              | Whether child folders should be included in the sink.                      | `bool`   | `false` | No       |
| `intercept_children`            | Whether to intercept logs from child folders.                              | `bool`   | `false` | No       |
| `bigquery_options`              | Configuration options for BigQuery sinks, such as partitioned tables.      | `list`   | `[]`    | No       |
| `exclusions`                    | List of exclusions, including name, description, and filter.               | `list`   | `[]`    | No       |

## Outputs

| Name                     | Description                                           |
|--------------------------|-------------------------------------------------------|
| `sink_id`                | The ID of the created logging sink.                   |
| `sink_name`              | The name of the created logging sink.                 |

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
