# Google Cloud Global Address Module

## Overview

This Terraform module is designed to create Google Cloud Global IP addresses, which are used for services like global load balancing. The module supports both **external** and **internal** global addresses, with dynamic configurations based on the address type and purpose. It allows you to set properties such as address description, network assignment, IP address, labels, and prefix length. 

This module is particularly useful for managing global static IP addresses that are necessary for various Google Cloud services such as HTTP(S) Load Balancers, Global External IPs, and other global network configurations.

## Features

- **Internal and External Global IP Addresses**: Supports the creation of both external and internal global IP addresses.
- **Flexible Configuration**: Dynamically configure address purpose, prefix length, and network for internal addresses.
- **Global Load Balancing**: Ideal for use with global load balancing and other services that require global IP addresses.
- **Labels**: Attach custom labels to the global IP address for better organization and management.
- **Network and Subnetwork Assignment**: Support for specifying a network for internal global IP addresses when required.

## Pre-requisites

Before using this module, ensure the following:

- A Google Cloud Project where the global IP address will be created.
- Terraform installed (version 0.12 or later).
- A valid Google Cloud authentication setup (e.g., using service account credentials).
- The `google-beta` provider configured in your Terraform setup.
- The region or global context set up for creating global resources.

## Inputs

| Variable Name             | Type     | Description                                                                                                       | Default |
|---------------------------|----------|-------------------------------------------------------------------------------------------------------------------|---------|
| `project_id`               | string   | The Google Cloud Project ID where the global address will be created.                                            | -       |
| `global_address_type`      | string   | Type of the address. Valid values are `INTERNAL` or `EXTERNAL`.                                                  | -       |
| `global_address_name`      | string   | The name of the global address.                                                                                  | -       |
| `global_address_description` | string   | A description for the global address.                                                                          | -       |
| `global_address_purpose`   | string   | The purpose of the address. This is required for internal addresses (e.g., `VPC_PEERING`, `IPSEC_INTERCONNECT`). | -       |
| `global_address_prefix_length` | number | The prefix length for internal addresses.                                                                      | -       |
| `global_address_network`   | string   | The network for internal addresses used in VPC peering or IPSEC interconnect.                                    | -       |
| `labels`                   | map      | Labels to be attached to the global address.                                                                     | {}      |
| `global_address_ip`        | string   | The internal IP address for internal addresses.                                                                  | -       |

## Outputs

| Output Name              | Description                                                 |
|--------------------------|-------------------------------------------------------------|
| `global_address_name`     | The name of the created global IP address.                 |
| `global_address_ip`       | The IP address assigned to the global address.             |
| `global_address_self_link`| The self-link URL for the created global address.          |

## Contacts and Contributing

If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes.
4. Submit a pull request with a description of your changes.

For any issues or inquiries, please open an issue in the GitHub repository.

### Maintainers:

- [Your Name] - [your.email@example.com]


