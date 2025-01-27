# Google Cloud Shared VPC Host Project Module

## Overview

This Terraform module manages the configuration of a Shared VPC Host Project in Google Cloud. It allows you to set up a host project to be used in a Shared VPC network architecture, enabling other service projects to attach their VPC networks to the shared VPC host project. This setup is useful for centralizing network resources and ensuring network policies are consistently applied across projects.

The module defines the Shared VPC host project by associating the provided project ID, enabling the management of networking resources in the specified project.

## Features

- **Shared VPC Host Setup**: Configures a project to be used as a Shared VPC host project, allowing other service projects to attach to its VPC.
- **Centralized Networking**: Enables the centralization of networking resources (such as subnets) in one host project.
- **Simplified Project Management**: Provides a straightforward method to define the host project for Shared VPC through a single Terraform module.

## Pre-requisites

Before using this module, ensure the following requirements are met:

- A Google Cloud Project where you want to configure the Shared VPC host.
- Terraform installed (version 0.12 or later).
- A valid Google Cloud authentication setup (e.g., using service account credentials).
- The `google` provider configured in your Terraform setup.

## Inputs

| Variable Name           | Type   | Description                                                                            | Default |
|-------------------------|--------|----------------------------------------------------------------------------------------|---------|
| `host_project_id`        | string | The Google Cloud project ID that will be configured as the Shared VPC Host Project.   | -       |

## Outputs

| Output Name             | Description                                          |
|-------------------------|------------------------------------------------------|
| `host_project`          | The project ID of the configured Shared VPC Host Project. |

## Contacts and Contributing

If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes.
4. Submit a pull request with a description of your changes.

For any issues or inquiries, please open an issue in the GitHub repository.

### Maintainers:

- [Your Name] - [your.email@example.com]