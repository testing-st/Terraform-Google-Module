# Google Cloud Subnet Configuration Module

## Overview

This module is designed to manage and configure Google Cloud subnets within a VPC network using Terraform. It allows dynamic creation of subnets with features like private IP access, flow logs, secondary IP ranges, and more. The module provides fine-grained control over the subnet configuration, including dynamic properties such as flow logs and secondary ranges.

## Features

- **Subnet Creation**: Create multiple subnets based on dynamic input data.
- **Private IP Access**: Support for enabling/disabling private IP Google access.
- **Flow Logs Configuration**: Allows setting up and customizing flow logs for each subnet, including aggregation intervals, sampling, and metadata.
- **Secondary IP Ranges**: Dynamically configure secondary IP ranges for subnets if specified.
- **Dynamic Properties**: Conditional configuration of subnet properties based on input variables (e.g., private IP access, flow logs, etc.).
- **Flexible Input**: Accepts a variety of optional and mandatory input parameters to meet your networking requirements.

## Pre-requisites

Before using this module, you should have the following:

- A Google Cloud Project and a VPC network where the subnets will be created.
- Terraform installed (version 0.12 or later).
- A valid Google Cloud authentication setup (e.g., using service account credentials).
- The `google` provider configured in your Terraform setup.

## Inputs

| Variable Name                  | Type    | Description                                                                                                          | Default |
|--------------------------------|---------|----------------------------------------------------------------------------------------------------------------------|---------|
| `subnets`                      | list    | List of subnet objects containing subnet details like name, region, IP range, and other parameters.                  | -       |
| `network_name`                 | string  | The name of the existing VPC network to which subnets will be attached.                                              | -       |
| `project_id`                   | string  | Google Cloud Project ID in which the subnets will be created.                                                        | -       |
| `secondary_ranges`             | map     | Map of secondary IP ranges for subnets, if any. The key is the subnet name and the value contains the range details. | {}      |

## Outputs

| Output Name                         | Description                                           |
|-------------------------------------|-------------------------------------------------------|
| `subnetwork_names`                  | A list of created subnets' names.                     |
| `subnetwork_self_links`             | A list of self-links for the created subnets.         |

## Contacts and Contributing

If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes.
4. Submit a pull request with a description of your changes.

For any issues or inquiries, please open an issue in the GitHub repository.

### Maintainers:

- [Your Name] - [your.email@example.com]
  
## License

This module is released under the [MIT License](LICENSE).
