# Google Compute Network VPC Module

## Overview
This Terraform module provisions a Google Cloud Virtual Private Cloud (VPC) network with various customizable settings such as routing mode, MTU, and internal IPv6 configurations. It provides a managed VPC network with the ability to control network behavior, enforce firewall policies, and handle default routes.

## Features
- Create a Google Cloud VPC network with flexible configurations.
- Supports auto subnet creation and custom subnet management.
- Configurable routing mode and MTU (Maximum Transmission Unit).
- Option to enable internal IPv6 addresses with customizable ranges.
- Enable or disable enforcement of network firewall policy.
- Option to delete default routes on network creation.
- Integration with Google Cloud’s provider using Terraform.

## Prerequisites
- A Google Cloud account and project.
- Terraform installed and configured with Google Cloud credentials.
- Proper IAM roles granted to the service account for creating and managing networks in Google Cloud.
- `google-beta` provider version for accessing the latest VPC features in Google Cloud.

## Inputs
| Variable                                    | Description                                                            | Type    | Default Value               |
|---------------------------------------------|------------------------------------------------------------------------|---------|-----------------------------|
| `network_name`                              | The name of the VPC network.                                           | string  | n/a                         |
| `description`                               | A description of the VPC network.                                      | string  | ""                          |
| `auto_create_subnetworks`                   | Whether or not to auto-create subnets within the network.              | bool    | true                        |
| `routing_mode`                              | The routing mode for the VPC network (e.g., REGIONAL or GLOBAL).       | string  | "REGIONAL"                  |
| `mtu`                                       | The Maximum Transmission Unit (MTU) for the VPC network.               | int     | 1460                        |
| `enable_ula_internal_ipv6`                  | Whether to enable ULA internal IPv6 addresses.                         | bool    | false                       |
| `internal_ipv6_range`                       | The IPv6 range for internal ULA addresses (if enabled).                | string  | "fd00::/8"                  |
| `network_firewall_policy_enforcement_order` | Order for enforcing firewall policies.                        		   | string  | "LIFO"                      |
| `project_id`                                | Google Cloud project ID.                                               | string  | n/a                         |
| `delete_default_internet_gateway_routes`    | Option to delete default internet gateway routes when creating the VPC.| bool    | false                       |

## Outputs
| Output                             | Description                                                        |
|------------------------------------|--------------------------------------------------------------------|
| `network_name`                     | The name of the created VPC network.                               |
| `self_link`                        | Self link of the created VPC network.                              |
| `id`                               | Unique ID of the created VPC network.                              |
| `region`                           | The region where the network is created.                           |

## Contacts and Contributing

For questions or to contribute to the module, feel free to reach out via the contact information below:

- Maintainer: [Your Name/Team]
- Email: [your-email@example.com]
- GitHub Repository: [link-to-repository]

Contributions are welcome! Please submit pull requests or open issues for improvements, bug fixes, or new features.

---
Licensed under the MIT License. See LICENSE for more information.
