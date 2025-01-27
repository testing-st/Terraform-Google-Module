# Google Cloud Firewall Rules Module

## Overview

This module is designed to manage and configure Google Cloud Firewall Rules using Terraform. It allows the creation of customizable firewall rules for VPC networks in Google Cloud, including support for specifying source and destination ranges, allowed/denied protocols and ports, logging configuration, and other advanced features. 

The module is flexible, supporting dynamic configuration based on input variables for multiple firewall rules at once.

## Features

- **Customizable Firewall Rules**: Dynamically create firewall rules with full flexibility for specifying name, direction, source and destination ranges, tags, and service accounts.
- **Protocol & Port Control**: Define allowed or denied protocols and ports for firewall rules.
- **Logging Configuration**: Enable or configure logging for each firewall rule.
- **Dynamic Inputs**: Allows configuration of rules using dynamic inputs, such as source and target tags, service accounts, and more.
- **Network Association**: Automatically associates the firewall rules with an existing VPC network.

## Pre-requisites

Before using this module, ensure the following requirements are met:

- A Google Cloud Project and VPC network where the firewall rules will be applied.
- Terraform installed (version 0.12 or later).
- A valid Google Cloud authentication setup (e.g., using service account credentials).
- The `google` provider configured in your Terraform setup.

## Inputs

| Variable Name                       | Type    | Description                                                                                                       | Default |
|-------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------|---------|
| `rules`                             | list    | List of firewall rule objects, each containing a complete set of attributes like name, direction, protocols, etc. | -       |
| `network_name`                      | string  | The name of the existing VPC network where firewall rules will be created.                                        | -       |
| `project_id`                        | string  | Google Cloud Project ID where firewall rules will be applied.                                                     | -       |

## Outputs

| Output Name                         | Description                                           |
|-------------------------------------|-------------------------------------------------------|
| `firewall_rule_names`               | List of names of the firewall rules created.          |
| `firewall_rule_self_links`          | List of self-links for the created firewall rules.    |

## Contacts and Contributing

If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes.
4. Submit a pull request with a description of your changes.

For any issues or inquiries, please open an issue in the GitHub repository.

### Maintainers:

- [Your Name] - [your.email@example.com]

