# Google Cloud Compute Address Module

## Overview

This module is designed to create Google Cloud Compute addresses, which are static IP addresses that can be associated with Google Cloud resources like virtual machine instances or load balancers. It supports both **internal** and **external** addresses, with dynamic configuration for purpose, network, subnetwork, and labels. The module also allows for configuring different network tiers and prefix lengths based on the requirements.

This module is flexible and allows for both public (external) and private (internal) IP address assignments, supporting a range of use cases such as VPC peering, IPSEC interconnect, and GCE endpoint configurations.

## Features

- **Internal and External IP Addresses**: Configure both internal and external IP addresses in a Google Cloud environment.
- **Dynamic Configuration**: Dynamically configure the address type (internal or external) and address purpose (e.g., for VPC peering or IPSEC interconnect).
- **Network Tier Support**: Automatically set the network tier for external IP addresses based on the input variable.
- **Custom Prefix Lengths**: Set the prefix length for addresses based on user-defined configurations.
- **Network and Subnetwork Assignment**: Specify the network and subnetwork for internal addresses used in VPC peering or GCE endpoints.
- **Labeling**: Attach labels to the address for better management and organization.

## Pre-requisites

Before using this module, ensure the following:

- A Google Cloud Project where the IP addresses will be created.
- Terraform installed (version 0.12 or later).
- A valid Google Cloud authentication setup (e.g., using service account credentials).
- The `google` provider configured in your Terraform setup.
- The region where you want to create the addresses.

## Inputs

| Variable Name            | Type     | Description                                                                                                | Default  |
|--------------------------|----------|----------------------------------------------------------------------------------------------------------  |--------- |
| `project_id`              | string   | The Google Cloud Project ID where the compute address will be created.                                    | -        |
| `region`                  | string   | The Google Cloud region in which the compute address will be created.                                     | -        |
| `address_type`            | string   | Type of the address. Valid values are `INTERNAL` or `EXTERNAL`.                                           | -        |
| `address_name`            | string   | The name of the compute address.                                                                          | -        |
| `address_description`     | string   | A description for the compute address.                                                                    | -        |
| `address_purpose`         | string   | The purpose of the address. Valid values include `VPC_PEERING`, `IPSEC_INTERCONNECT`, or `GCE_ENDPOINT`.  | -        |
| `network_tier`            | string   | The network tier for the external IP address. Valid values are `PREMIUM` or `STANDARD`.                   | `PREMIUM`|
| `address_prefix_length`   | number   | The prefix length for the address (only for internal addresses).                                          | -        |
| `address_network`         | string   | The network for internal addresses used in VPC peering or IPSEC interconnect (for internal addresses).    | -        |
| `address_subnetwork`      | string   | The subnetwork for internal addresses used in GCE endpoint configurations.                                | -        |
| `labels`                  | map      | Labels to be attached to the compute address.                                                             | {}       |
| `address_ip`              | string   | The internal IP address for internal addresses.                                                           | -        |

## Outputs

| Output Name           | Description                                                      |
|-----------------------|------------------------------------------------------------------|
| `address_name`        | The name of the created compute address.                         |
| `address_ip`          | The IP address assigned to the resource.                         |
| `address_self_link`   | The self-link URL for the created compute address.               |

## Contacts and Contributing

If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes.
4. Submit a pull request with a description of your changes.

For any issues or inquiries, please open an issue in the GitHub repository.

### Maintainers:

- [Your Name] - [your.email@example.com]

