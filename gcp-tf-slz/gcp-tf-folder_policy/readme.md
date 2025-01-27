# Google Artifact Registry Repository Setup using Terraform

## Overview

This repository contains Terraform configuration files for managing Google Artifact Registry repositories. This module supports creating and configuring repositories for various formats, including Docker, Maven, and more, with advanced options like cleanup policies and remote configurations.

## Features

- Supports multiple repository formats (e.g., Docker, Maven, Python).
- Configurable cleanup policies to manage artifacts.
- Secure integration with KMS for encryption.
- Flexible configuration for remote and virtual repositories.
- Automated management of upstream and credentials.

## Prerequisites

Before using this module, ensure the following:

- **Google Cloud Account**: Active Google Cloud account with project-level access.
- **Terraform Installed**: Install Terraform from [Terraform's official website](https://www.terraform.io/downloads.html).
- **Google Cloud SDK**: Install and configure the Google Cloud SDK ([instructions](https://cloud.google.com/sdk/docs/install)).
- **IAM Permissions**: Ensure you have permissions:
  - `roles/artifactregistry.admin`
  - `roles/storage.admin`
  - `roles/cloudkms.cryptoKeyEncrypterDecrypter` (if using KMS).

## Inputs

| Name                           | Description                                                                 | Type     | Default | Required |
|--------------------------------|-----------------------------------------------------------------------------|----------|---------|----------|
| `project`                      | The project ID where the repository will be created.                       | `string` | n/a     | Yes      |
| `repository_id`                | The ID of the repository.                                                  | `string` | n/a     | Yes      |
| `format`                       | The format of the repository (e.g., `DOCKER`, `MAVEN`).                    | `string` | n/a     | Yes      |
| `location`                     | The location where the repository will be created.                         | `string` | n/a     | Yes      |
| `description`                  | Description of the repository.                                             | `string` | `""`    | No       |
| `labels`                       | Key-value pairs for labeling the repository.                               | `map`    | `{}`    | No       |
| `kms_key_name`                 | The KMS key name for encryption.                                           | `string` | `""`    | No       |
| `docker_config`                | Configuration for Docker repositories.                                     | `list`   | `[]`    | No       |
| `maven_config`                 | Configuration for Maven repositories.                                      | `list`   | `[]`    | No       |
| `mode`                         | The mode of the repository (`STANDARD`, `VIRTUAL`, `REMOTE`).              | `string` | n/a     | Yes      |
| `virtual_repository_config`    | Configuration for virtual repositories.                                    | `list`   | `[]`    | No       |
| `cleanup_policies`             | Cleanup policies for managing artifacts.                                   | `list`   | `[]`    | No       |
| `remote_repository_config`     | Configuration for remote repositories.                                     | `list`   | `[]`    | No       |
| `cleanup_policy_dry_run`       | Whether to enable dry-run mode for cleanup policies.                       | `bool`   | `false` | No       |

## Outputs

| Name                    | Description                                            |
|-------------------------|--------------------------------------------------------|
| `repository_id`         | The ID of the created repository.                      |
| `repository_url`        | The URL of the repository.                             |
| `repository_location`   | The location where the repository is hosted.           |

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
