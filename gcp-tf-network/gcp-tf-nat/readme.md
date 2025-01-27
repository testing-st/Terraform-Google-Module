# Google Compute Router NAT Module

This Terraform module manages the configuration of a Google Compute Router NAT (Network Address Translation) in Google Cloud Platform. It allows you to control and customize NAT configurations on a specified router, including IP allocation, subnetwork rules, port allocation, logging configurations, and more.

## Overview

This module provisions a Google Compute Router NAT to provide outbound internet connectivity to instances in a Virtual Private Cloud (VPC) without using external IP addresses. You can customize settings such as IP allocation, source ranges, dynamic port allocation, and logging. It also allows for custom NAT rules and configurations.

## Features

- **Dynamic Subnetworks**: Configure multiple subnetworks with customized NAT settings.
- **Manual IP Allocation**: Support for both dynamic and manual IP allocation.
- **Port Allocation**: Customize minimum and maximum ports per VM for better resource management.
- **Idle Timeout Configurations**: Fine-grained control over idle timeouts for various protocols (UDP, ICMP, TCP).
- **Logging Configuration**: Option to enable and filter NAT logs for monitoring and troubleshooting.
- **Custom Rules**: Define custom NAT rules, including source NAT ranges and IP configurations.
- **Endpoint Types**: Specify endpoint types for the NAT configuration.
  
## Pre-requisites

Before using this module, ensure the following:

- You must have a Google Cloud project created.
- Google Cloud provider configured for Terraform (`google` or `google_beta`).
- A Google Cloud Router must already be created and available to associate with the NAT.
- Terraform 1.x or higher installed.

## Inputs

| Name                                    | Description                                                                            | Type           | Default    | Required |
|-----------------------------------------|----------------------------------------------------------------------------------------|----------------|------------|----------|
| `project_id`                            | The Google Cloud project ID where the router NAT will be created.                      | `string`       | n/a        | yes      |
| `region`                                | The region where the router and NAT will be deployed.                                  | `string`       | n/a        | yes      |
| `nat_name`                              | The name of the NAT configuration.                                                     | `string`       | n/a        | yes      |
| `router_name`                           | The name of the router where NAT will be configured.                                   | `string`       | n/a        | yes      |
| `nat_ip_allocate_option`                | The IP allocation option for the NAT (e.g., `MANUAL_ONLY`).                            | `string`       | n/a        | yes      |
| `initial_nat_ips`                       | List of initial NAT IPs (if `nat_ip_allocate_option` is `MANUAL_ONLY`).                | `list(string)` | []         | no       |
| `nat_ips`                               | The list of IPs to be used for the NAT (if `nat_ip_allocate_option` is `MANUAL_ONLY`). | `list(string)` | []         | no       |
| `source_subnetwork_ip_ranges_to_nat`    | Subnetworks to configure for NAT. Can be a list of subnetwork names.                   | `list(string)` | []         | no       |
| `min_ports_per_vm`                      | Minimum number of ports per VM.                                                        | `number`       | 2048       | no       |
| `max_ports_per_vm`                      | Maximum number of ports per VM.                                                        | `number`       | 65535      | no       |
| `enable_dynamic_port_allocation`        | Enable dynamic port allocation (default is `false`).                                   | `bool`         | false      | no       |
| `type`                                  | Type of the NAT configuration (e.g., `NAT_TYPE` - custom).                             | `string`       | n/a        | yes      |
| `udp_idle_timeout_sec`                  | UDP idle timeout in seconds.                                                           | `number`       | 600        | no       |
| `icmp_idle_timeout_sec`                 | ICMP idle timeout in seconds.                                                          | `number`       | 600        | no       |
| `tcp_established_idle_timeout_sec`      | TCP established idle timeout in seconds.                                               | `number`       | 600        | no       |
| `tcp_transitory_idle_timeout_sec`       | TCP transitory idle timeout in seconds.                                                | `number`       | 600        | no       |
| `tcp_time_wait_timeout_sec`             | TCP time-wait idle timeout in seconds.                                                 | `number`       | 600        | no       |
| `enable_endpoint_independent_mapping`   | Enable endpoint-independent mapping.                                                   | `bool`         | false      | no       |
| `subnetworks`                           | A map of subnetworks to configure with their specific settings.                        | `map(object)`  | {}         | no       |
| `log_config_enable`                     | Whether to enable NAT logging.                                                         | `bool`         | false      | no       |
| `log_config_filter`                     | The filter to apply to the NAT logs (used when `log_config_enable` is true).           | `string`       | "NONE"     | no       |
| `endpoint_types`                        | A list of endpoint types for the NAT configuration.                                    | `list(string)` | []         | no       |
| `rules`                                 | List of custom NAT rules to apply to the configuration.                                | `list(object)` | []         | no       |
| `auto_network_tier`                     | Set the network tier for the NAT configuration.                                        | `string`       | "PREMIUM"  | no       |

## Outputs

| Name                                    | Description                                                      |
|-----------------------------------------|------------------------------------------------------------------|
| `nat_name`                              | The name of the configured NAT resource.                         |
| `router_nat_ip`                         | The allocated or specified NAT IP(s).                            |
| `log_config_enabled`                    | Indicates whether logging is enabled for the NAT configuration.  |
| `configured_rules`                      | The rules configured in the NAT setup.                           |

## Contacts and Contributing

If you encounter any issues or have questions, feel free to reach out to the module maintainers or contribute improvements by opening a GitHub issue or pull request.

- **Author**: [Your Name or Organization]
- **GitHub Repository**: [URL to GitHub repo]
- **License**: [Insert license type here]

Contributions are always welcome! Please follow the standard [GitHub contribution workflow](https://github.com/firstcontribution/first-contributions) for submitting pull requests.

---

Happy Cloud Networking!
