# Google DNS Managed Zone Module

## Overview

This Terraform module is used to create and manage a Google Cloud DNS Managed Zone. It supports both public and private zones, with configuration options for DNSSEC, DNS forwarding, private visibility, and peering. It allows for flexible configuration based on different requirements like GKE clusters and network visibility.

## Features

- **Support for both Public and Private DNS Zones**: The module automatically adjusts based on the visibility setting (public or private).
- **DNSSEC Configuration**: Optional DNSSEC support for enhanced security, including key specifications.
- **Private Visibility**: Integration with VPC networks and GKE clusters to limit DNS visibility to specific resources.
- **DNS Forwarding**: Configuration to forward DNS queries to specified external name servers.
- **Peering Configuration**: Option to set up DNS peering with other networks.
- **Cloud Logging**: Option to enable DNS query logging for better visibility.

## Prerequisites

Before using this module, ensure you have:

- A Google Cloud account with necessary permissions to manage DNS resources.
- Terraform installed and configured with access to Google Cloud.
- A project setup in Google Cloud.
- Networks or GKE clusters for private zones (if applicable).

## Inputs

| Variable Name              | Description                                                   | Type                | Default Value           |
|----------------------------|---------------------------------------------------------------|---------------------|-------------------------|
| `project_id`               | The Google Cloud project ID where the DNS zone will be created| `string`            | `""`                    |
| `zone_visibility`          | The visibility of the DNS zone (public/private)               | `string`            | `""`                    |
| `name`                     | The name of the DNS zone                                      | `string`            | `""`                    |
| `dns_name`                 | The DNS name for the zone (e.g., example.com.)                | `string`            | `""`                    |
| `dns_description`          | A description for the DNS zone                                | `string`            | `""`                    |
| `labels`                   | A set of key-value labels to assign to the DNS zone           | `map(string)`       | `{}`                    |
| `dnssec_kind`              | The DNSSEC kind (e.g., `ds` or `key`)                         | `string`            | `""`                    |
| `dnssec_state`             | The state of DNSSEC (e.g., `on`, `off`)                       | `string`            | `""`                    |
| `dnssec_non_existence`     | Non-existence state of DNSSEC (only when state is off)        | `string`            | `""`                    |
| `default_key_specs`        | Key specifications for DNSSEC (when state is off)             | `list(map(string))` | `[]`                    |
| `networks`                 | A list of networks for private DNS visibility                 | `list(map(string))` | `[]`                    |
| `gke_clusters`             | A list of GKE clusters for private DNS visibility             | `list(map(string))` | `[]`                    |
| `forwarding_config`        | Forwarding configuration for DNS queries                      | `list(map(string))` | `[]`                    |
| `peering_network_url`      | The network URL for peering configuration                     | `string`            | `null`                  |
| `force_destroy`            | Whether to force destroy the DNS zone even if it has records  | `bool`              | `false`                 |
| `enable_logging`           | Enable cloud logging for DNS queries                          | `bool`              | `false`                 |

## Outputs

| Output Name                | Description                                                   |
|----------------------------|---------------------------------------------------------------|
| `zone_name`                | The name of the created DNS zone                              |
| `dns_name`                 | The DNS name associated with the zone                         |
| `dnssec_config`            | DNSSEC configuration (if applicable)                          |
| `private_visibility_config`| Configuration for private visibility (networks or clusters)   |
| `forwarding_config`        | Forwarding configuration details                              |
| `peering_config`           | Peering configuration details (if applicable)                 |


## Contract and Contributing
If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

Fork the repository.
Create a new branch for your changes.
Make your changes.
Submit a pull request with a description of your changes.
For any issues or inquiries, please open an issue in the GitHub repository.

## Maintainers:
[Your Name] - [your.email@example.com]
License
This module is released under the MIT License.


