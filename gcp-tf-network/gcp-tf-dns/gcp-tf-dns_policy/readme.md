# Google DNS Policy and Response Policy Module

## Overview

This Terraform module allows you to manage Google Cloud DNS Policies, Response Policies, and Response Policy Rules. The module enables fine-grained control over DNS forwarding, logging, and custom response policies that define how DNS queries are resolved. It also supports advanced configurations such as networks and GKE cluster-based routing and allows users to define local data for custom DNS responses.

## Features

- **DNS Policy Management**: Create and manage DNS policies with inbound forwarding and logging options.
- **Response Policy Management**: Define response policies for DNS resolution based on networks and GKE clusters.
- **Response Policy Rules**: Configure custom DNS response behavior using local data or other advanced configurations.
- **Support for Networks and GKE Clusters**: Apply DNS policies and rules to specific VPC networks or Google Kubernetes Engine (GKE) clusters.
- **Flexible Configuration**: Define target name servers, DNS response forwarding paths, and network-specific settings dynamically.

## Prerequisites

Before using this module, ensure you have:

- A Google Cloud project with permissions to manage DNS resources.
- Terraform installed and configured with access to Google Cloud.
- A valid DNS Managed Zone in your Google Cloud project.
- Networks or GKE clusters configured for the private DNS use cases (if applicable).

## Inputs

| Variable Name                   | Description                                                                                        | Type                          | Default Value      |
|-----------------------------------|------------------------------------------------------------------------------------------------- |-------------------------------|--------------------|
| `project_id`                     | The Google Cloud project ID where the resources will be created.                                  | `string`                      | `""`               |
| `policy_name`                    | The name of the DNS policy to be created.                                                         | `string`                      | `""`               |
| `description`                    | A description of the DNS policy.                                                                  | `string`                      | `""`               |
| `enable_inbound_forwarding`      | Whether to enable inbound forwarding for the policy.                                              | `bool`                        | `false`            |
| `policy_enable_logging`          | Whether to enable logging for the policy.                                                         | `bool`                        | `false`            |
| `target_name_servers`            | A list of target name servers for forwarding configuration.                                       | `list(map(string))`           | `[]`               |
| `networks`                       | A list of networks to apply the DNS policy to.                                                    | `list(map(string))`           | `[]`               |
| `response_policy_name`           | The name of the DNS response policy to be created.                                                | `string`                      | `""`               |
| `policy_rule_description`        | A description of the DNS response policy rule.                                                    | `string`                      | `""`               |
| `policy_rule_networks`           | A list of networks for which the DNS response policy should be applied.                           | `list(map(string))`           | `[]`               |
| `policy_rule_gke_clusters`       | A list of GKE clusters for which the DNS response policy should be applied.                       | `list(map(string))`           | `[]`               |
| `local_data`                     | A list of local DNS records for custom DNS response behavior.                                     | `list(map(any))`              | `[]`               |

## Outputs

| Output Name                    | Description                                                   |
|---------------------------------|------------------------------------------------------------- |
| `policy_name`                  | The name of the created DNS policy                            |
| `description`                  | The description of the created DNS policy                     |
| `enable_inbound_forwarding`    | The inbound forwarding setting for the created DNS policy     |
| `enable_logging`               | The logging setting for the created DNS policy                |
| `target_name_servers`          | The target name servers for DNS forwarding                    |
| `networks`                     | The networks associated with the DNS policy                   |
| `response_policy_name`         | The name of the created DNS response policy                   |
| `policy_rule_description`      | The description of the created DNS response policy            |
| `policy_rule_networks`         | The networks associated with the response policy              |
| `policy_rule_gke_clusters`     | The GKE clusters associated with the response policy          |

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