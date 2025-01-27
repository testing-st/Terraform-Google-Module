# Google Cloud Project Services(APIs) Setup using Terraform

## Overview

This repository contains Terraform configuration files for enabling and managing Google Cloud Project Services (APIs). This module allows you to automate the activation of required APIs for your projects, ensuring they are ready for use.

## Features

- Automated enabling of Google Cloud APIs.
- Option to disable APIs upon resource destruction.
- Support for dependent service management.
- Dynamic configuration for multiple APIs.

## Prerequisites

Before using this module, ensure the following:

- **Google Cloud Account**: Active Google Cloud account with project-level access.
- **Terraform Installed**: Install Terraform from [Terraform's official website](https://www.terraform.io/downloads.html).
- **Google Cloud SDK**: Install and configure the Google Cloud SDK ([instructions](https://cloud.google.com/sdk/docs/install)).
- **IAM Permissions**: Ensure you have permissions:
  - `roles/serviceusage.serviceUsageAdmin`
  - `roles/owner` or `roles/editor` (for the project).

## Inputs

| Name                       | Description                                                   | Type     | Default        | Required |
|----------------------------|---------------------------------------------------------------|----------|----------------|----------|
| `gcp_apis_list`            | List of APIs to enable for the project.                       | `list`   | n/a            | Yes      |
| `project_id`               | The ID of the project where the APIs are enabled.             | `string` | n/a            | Yes      |
| `disable_apis_on_destroy`  | Whether to disable the APIs when the resource is destroyed.   | `bool`   | `false`        | No       |
| `disable_dependent_apis`   | Whether to disable dependent services when disabling APIs.    | `bool`   | `false`        | No       |

## Outputs

| Name                  | Description                                |
|-----------------------|--------------------------------------------|
| `enabled_apis`        | List of APIs enabled for the project.      |

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