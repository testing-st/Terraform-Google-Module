# Google DNS Record Set Module

## Overview

This Terraform module manages Google Cloud DNS Record Sets. It supports a variety of record types (e.g., A, CNAME, TXT), custom Time-To-Live (TTL) values, and complex routing policies (e.g., weighted, geo, and primary-backup). The module allows for flexibility in DNS configuration, enabling DNS records with sophisticated routing policies, load balancing, and geo-fencing for both internal and external DNS resources.

## Features

- **Flexible Record Types**: Supports all common DNS record types like A, CNAME, TXT, etc.
- **Custom TTL**: Allows setting custom TTL (Time-To-Live) for DNS records.
- **Routing Policies**: Supports multiple types of routing policies:
  - **Weighted Round Robin (WRR)**: Assign different weights to DNS responses.
  - **Geo-based Routing**: Route DNS queries based on geographical location.
  - **Primary-Backup Routing**: Set up primary-backup routing with optional geo-fencing for backups.
- **Health Check Integration**: Allows integration with health checks for internal load balancers to ensure routing based on availability.
- **Load Balancer Integration**: Supports routing to internal load balancers with detailed configuration options.
- **Geo-fencing**: Enable geo-fencing for backup records to ensure the routing behavior is based on regional policies.
  
## Prerequisites

Before using this module, ensure you have the following:

- A Google Cloud account with the necessary permissions to manage DNS resources.
- Terraform installed and configured with access to your Google Cloud project.
- An existing DNS Managed Zone where records will be created.
- If using routing policies, ensure health checks and load balancer configurations are set up.

## Inputs

| Variable Name             | Description                                                   | Type                          | Default Value        |
|---------------------------|---------------------------------------------------------------|-------------------------------|----------------------|
| `project_id`              | The Google Cloud project ID where the DNS record set will be created | `string`                      | `""`                 |
| `record_name`             | The name of the DNS record (e.g., www.example.com.)           | `string`                      | `""`                 |
| `managed_zone`            | The name of the managed DNS zone in which the record will be created | `string`                      | `""`                 |
| `record_type`             | The type of the DNS record (A, CNAME, TXT, etc.)              | `string`                      | `""`                 |
| `ttl`                     | The TTL (Time-To-Live) for the DNS record                     | `number`                      | `3600`               |
| `rrdatas`                 | The resource data for the DNS record (e.g., IP address)       | `list(string)`                | `[]`                 |
| `routing_policies`        | A list of routing policies to apply (e.g., WRR, geo, primary-backup) | `list(map(any))`              | `[]`                 |
| `dnssec_state`            | The DNSSEC state (e.g., "off" or "on")                        | `string`                      | `"off"`              |

## Outputs

| Output Name               | Description                                                   |
|---------------------------|---------------------------------------------------------------|
| `record_name`             | The name of the created DNS record                            |
| `managed_zone`            | The name of the DNS managed zone                              |
| `record_type`             | The type of the created DNS record                            |
| `ttl`                     | The TTL for the created DNS record                            |
| `rrdatas`                 | The resource data for the created DNS record                  |
| `routing_policies`        | The routing policies applied to the DNS record                |

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