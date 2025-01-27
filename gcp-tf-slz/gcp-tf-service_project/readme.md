# Google Cloud Shared VPC Service Project Module

## Overview

This Terraform module allows you to configure a Google Cloud project as a Service Project that connects to a Shared VPC Host Project. In a Shared VPC setup, the Host Project holds the network resources (such as subnets), and Service Projects can access these resources. This module makes it easy to associate a Service Project with an existing Shared VPC Host Project, enabling cross-project networking in Google Cloud.

The module uses the `google-beta` provider to associate a service project with a host project in the context of a Shared VPC setup.

## Features

- **Shared VPC Service Project Configuration**: Easily configure a project as a Service Project within a Shared VPC setup.
- **Cross-Project Networking**: Allows Service Projects to use subnets and other network resources from a central Host Project.
- **Flexible Integration**: Supports configuring the relationship between the Host and Service Projects dynamically using input variables.
- **Beta API Support**: Uses the `google-beta` provider to manage the Shared VPC configuration.

## Pre-requisites

Before using this module, ensure the following:

- A Google Cloud Project acting as the **Shared VPC Host Project**.
- A **Service Project** that needs to be linked to the Shared VPC Host Project.
- Terraform installed (version 0.12 or later).
- A valid Google Cloud authentication setup (e.g., using service account credentials).
- The `google-beta` provider configured in your Terraform setup.

## Inputs

| Variable Name          | Type   | Description                                                                      | Default |
|------------------------|--------|----------------------------------------------------------------------------------|---------|
| `host_project_id`      | string | The Google Cloud project ID that acts as the Shared VPC Host Project.            | -       |
| `service_project_id`   | string | The Google Cloud project ID to be configured as the Shared VPC Service Project.  | -       |

## Outputs

| Output Name           | Description                                                  |
|-----------------------|--------------------------------------------------------------|
| `service_project`     | The project ID of the configured Shared VPC Service Project. |

## Contacts and Contributing

If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes.
4. Submit a pull request with a description of your changes.

For any issues or inquiries, please open an issue in the GitHub repository.

### Maintainers:

- [Your Name] - [your.email@example.com]


