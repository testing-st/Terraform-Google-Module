# Google Organization Policy Setup using Terraform

## Overview

This repository contains Terraform configuration files for managing Google Cloud Organization Policies. This module allows you to create and manage organization-level policies, including constraints and different policy types such as Boolean, List, and Restore policies.

## Features

- Supports the creation of organization policies at the organizational level.
- Allows configuration of Boolean policies with enforcement settings.
- Flexible List policies that enable specific allow or deny rules and suggested values.
- Restore policies that can reset to a default policy value.
- Dynamic management of policy types based on user input.

## Prerequisites

Before using this module, ensure the following:

- **Google Cloud Account**: Active Google Cloud account with project-level access.
- **Terraform Installed**: Install Terraform from [Terraform's official website](https://www.terraform.io/downloads.html).
- **Google Cloud SDK**: Install and configure the Google Cloud SDK ([instructions](https://cloud.google.com/sdk/docs/install)).
- **IAM Permissions**: Ensure you have the necessary permissions:
  - `roles/orgpolicy.policyAdmin` (for managing organization policies).

## Inputs

| Name                           | Description                                                                              | Type     | Default | Required |
|---------------------------------|-----------------------------------------------------------------------------------------|----------|---------|----------|
| `org_id`                        | The ID of the organization for which the policy will be applied.                        | `string` | n/a     | Yes      |
| `constraint`                    | The constraint for the policy (e.g., `constraints/compute.disableSerialPortAccess`).    | `string` | n/a     | Yes      |
| `policy_version`                | The version of the policy (e.g., `1`).                                                  | `string` | n/a     | Yes      |
| `boolean_policy`                | The Boolean policy configuration (e.g., enforcement setting).                           | `list`   | `[]`    | No       |
| `list_policy`                   | List policy configuration (allow/deny values, suggested value).                         | `list`   | `[]`    | No       |
| `restore_policy`                | Restore policy configuration (reset to default).                                        | `list`   | `[]`    | No       |

## Outputs

| Name                     | Description                                            |
|--------------------------|--------------------------------------------------------|
| `policy_id`              | The ID of the created organization policy.             |
| `policy_constraint`      | The constraint associated with the organization policy.|

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
