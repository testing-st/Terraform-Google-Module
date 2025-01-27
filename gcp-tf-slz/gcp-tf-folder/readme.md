# Google Cloud Folder Setup using Terraform

## Overview

This repository contains Terraform configuration files for provisioning and managing a Google Cloud Folder. The configuration allows for structured organization of resources under a Google Cloud Organization or another folder.

## Features

- Automated creation of Google Cloud folders.
- Integration with Google Cloud organizational structure.
- Support for hierarchical resource organization.
- Configurable folder labels for better resource management.

## Prerequisites

Before using this module, ensure the following:

- **Google Cloud Account**: Active Google Cloud account with organizational access.
- **Terraform Installed**: Install Terraform from [Terraform's official website](https://www.terraform.io/downloads.html).
- **Google Cloud SDK**: Install and configure the Google Cloud SDK ([instructions](https://cloud.google.com/sdk/docs/install)).
- **IAM Permissions**: Ensure you have permissions:
  - `roles/resourcemanager.folderCreator`
  - `roles/resourcemanager.folderAdmin`

## Inputs

| Name                 | Description                                           | Type     | Default        | Required |
|----------------------|-------------------------------------------------------|----------|----------------|----------|
| `folder_name`        | The display name of the Google Cloud folder.          | `string` | n/a            | Yes      |
| `parent_id`          | The ID of the parent folder or organization.          | `string` | n/a            | Yes      |
| `labels`             | Labels for the folder as key-value pairs.             | `map`    | `{}`           | No       |

## Outputs

| Name            | Description                                |
|-----------------|--------------------------------------------|
| `folder_id`     | The unique ID of the created folder.       |
| `folder_name`   | The name of the created folder.            |

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
