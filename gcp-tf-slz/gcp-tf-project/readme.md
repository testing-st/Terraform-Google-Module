# Google Cloud Project Setup using Terraform

## Overview

This repository contains Terraform configuration files for provisioning and managing a Google Cloud Project. The configuration includes billing setup, organizational association, and basic network configuration. It is modular and reusable.

## Features

- Automated creation of Google Cloud projects.
- Integration with Google Cloud billing accounts.
- Support for organizational and folder-based project management.
- Configurable auto-network creation and resource tagging.
- Flexible project deletion policies.

## Prerequisites

Before using this module, ensure the following:

- **Google Cloud Account**: Active Google Cloud account with billing enabled.
- **Terraform Installed**: Install Terraform from [Terraform's official website](https://www.terraform.io/downloads.html).
- **Google Cloud SDK**: Install and configure the Google Cloud SDK ([instructions](https://cloud.google.com/sdk/docs/install)).
- **IAM Permissions**: Ensure you have permissions:
  - `roles/resourcemanager.projectCreator`
  - `roles/billing.admin`
  - `roles/iam.securityAdmin`
  - `roles/storage.admin`

## Inputs

| Name                   | Description                                           | Type     | Default        | Required |
|------------------------|-------------------------------------------------------|----------|----------------|----------|
| `project_id`           | The unique ID of your Google Cloud project.           | `string` | n/a            | Yes      |
| `project_name`         | The name of your project.                             | `string` | n/a            | Yes      |
| `billing_account_name` | The display name of the billing account.              | `string` | n/a            | Yes      |
| `folder_id`            | The folder ID to place the project under.             | `string` | `""`           | No       |
| `org_id`               | The organization ID to associate with the project.    | `string` | n/a            | Yes      |
| `auto_create_network`  | Whether to auto-create a default network.             | `bool`   | `true`         | No       |
| `labels`               | Labels for the project as key-value pairs.            | `map`    | `{}`           | No       |
| `tags`                 | Tags to associate with the project.                   | `list`   | `[]`           | No       |
| `deletion_policy`      | The deletion policy for the project (e.g., `DELETE`). | `string` | `DELETE`       | No       |

## Outputs

| Name            | Description                                |
|-----------------|--------------------------------------------|
| `project_id`    | The unique ID of the created project.      |
| `project_number`| The unique number of the created project.  |
| `billing_id`    | The billing account ID associated.         |

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

