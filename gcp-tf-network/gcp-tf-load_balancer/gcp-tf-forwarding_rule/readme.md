# Google Cloud Frontend Resource Module

## Overview

This module allows you to create and manage Google Cloud Frontend resources such as `google_compute_forwarding_rule` (regional) and `google_compute_global_forwarding_rule` (global). These resources are essential for configuring Google Cloud's load balancing and forwarding rules, supporting both regional and global configurations.

## Features

| Feature                                       | Description                                                                                                                                                          |
|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Regional Frontend**                         | Creates a regional forwarding rule, including network, subnetwork, backend service, and IP configuration.                                                            |
| **Global Frontend**                           | Creates a global forwarding rule, with extended features like metadata filtering and global service directory registration.                                          |
| **Service Directory Registration**            | Registers services in Google Cloud's Service Directory for better management and auto-discovery of backend services.                                                 |
| **Traffic Mirroring**                         | Optionally enables traffic mirroring for debugging or monitoring purposes.                                                                                           |
| **Metadata Filters**                          | Allows metadata-based filtering, allowing more granular control over the traffic forwarded by the rule.                                                              |
| **Support for Private Service Connect (PSC)** | Provides configuration for Private Service Connect global access.                                                                                                    |
| **Automatic DNS Management**                  | Optionally handles DNS zone automation for seamless integration with DNS services.                                                                                   |

## Prerequisites

| Requirement                         | Description                                                                                                                                                           |
|--------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Google Cloud Project**             | A Google Cloud project with appropriate permissions to create forwarding rules, load balancers, and target proxies.                                                  |
| **Terraform**                        | Terraform version 0.12 or higher installed.                                                                                                                          |
| **IAM Permissions**                  | Proper IAM permissions for managing resources like forwarding rules, load balancers, target proxies, and service directory entries.                                  |
| **Network and Subnetwork**           | A pre-configured VPC network and subnetwork where the forwarding rule will reside.                                                                                   |
| **Variable Configuration**           | Variables such as `frontend_project_id`, `ip_address`, `backend_service`, `ports`, and others need to be defined in your Terraform configuration.                    |

## Inputs

| Input                                 | Type                | Description                                                                                                                                                          |
|---------------------------------------|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `frontend_project_id`                 | `string`            | (Optional) The project ID to create the resources in. If not set, defaults to `local.project`.                                                                       |
| `scope`                               | `string`            | Defines whether the rule is `regional` or `global`.                                                                                                                  |
| `frontend_name`                       | `string`            | The name for the forwarding rule.                                                                                                                                    |
| `is_mirroring_collector`              | `bool`              | (Optional) Boolean flag to enable traffic mirroring.                                                                                                                 |
| `frontend_description`                | `string`            | Description for the forwarding rule.                                                                                                                                 |
| `ip_address`                          | `string`            | The IP address for the forwarding rule.                                                                                                                              |
| `ip_protocol`                         | `string`            | The IP protocol (e.g., TCP, UDP).                                                                                                                                    |
| `backend_service`                     | `string`            | The backend service associated with the forwarding rule.                                                                                                             |
| `load_balancing_scheme`               | `string`            | Load balancing scheme (e.g., EXTERNAL, INTERNAL).                                                                                                                    |
| `network`                             | `string`            | The network where the resource will be created.                                                                                                                      |
| `port_range`                          | `string`            | The port range for the forwarding rule.                                                                                                                              |
| `ports`                               | `list(string)`      | A list of ports to be listened on.                                                                                                                                   |
| `target_proxy_id`                     | `string`            | The ID of the target proxy associated with the forwarding rule.                                                                                                      |
| `allow_global_access`                 | `bool`              | (Optional) Boolean flag to allow global access.                                                                                                                      |
| `labels`                              | `map(string)`       | A set of labels to assign to the forwarding rule.                                                                                                                    |
| `all_ports`                           | `bool`              | Boolean flag to listen on all ports.                                                                                                                                 |
| `network_tier`                        | `string`            | The network tier (e.g., `PREMIUM`, `STANDARD`).                                                                                                                      |
| `service_directory_registrations`     | `list(map(string))` | A list of service directory registrations to auto-register services.                                                                                                 |
| `source_ip_ranges`                    | `list(string)`      | A list of source IP ranges allowed for traffic.                                                                                                                      |
| `allow_psc_global_access`             | `bool`              | (Optional) Boolean flag to enable PSC global access.                                                                                                                 |
| `no_automate_dns_zone`                | `bool`              | (Optional) Boolean flag to disable automatic DNS zone management.                                                                                                    |
| `ip_version`                          | `string`            | The IP version (e.g., `IPV4`, `IPV6`).                                                                                                                               |
| `region`                              | `string`            | The region for the regional forwarding rule.                                                                                                                         |
| `recreate_closed_psc`                 | `bool`              | (Optional) Boolean flag to recreate closed PSC resources.                                                                                                           \|

## Outputs

| Output                                 | Description                                                                                  |
|----------------------------------------|----------------------------------------------------------------------------------------------|
| `frontend_forwarding_rule_id`          | The ID of the created forwarding rule (regional or global based on scope).                   |
| `frontend_forwarding_rule_ip`          | The IP address assigned to the forwarding rule.                                              |
| `frontend_forwarding_rule_target`      | The target proxy ID associated with the forwarding rule.                                     |

## Contacts and Contributing

If you have any questions or would like to contribute to this module, feel free to reach out or open an issue in the GitHub repository.

### Maintainers

- [Your Name or Organization] - [your-email@example.com]


