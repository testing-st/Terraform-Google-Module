# Google Compute Network Peering Module

This Terraform module manages the creation of network peering between two Google Cloud VPCs. The module provisions two `google_compute_network_peering` resources: one for the local network peering and another for the peer network peering, ensuring that routes are exported and imported correctly between the networks.

## Overview

This module sets up VPC peering between two networks in Google Cloud, enabling communication between the two networks. The module automatically generates unique names for the peering configurations and allows you to control route export and import settings, including custom routes and subnet routes with public IPs. It also ensures that the peering resources are created in the correct order by using dependencies.

## Features

- **Dynamic Peering Name Generation**: Automatically creates network peering names based on the local and peer network names and the provided prefix.
- **Route Export/Import Configuration**: Customize whether to export or import custom routes and subnet routes, including routes with public IPs.
- **Network Peering Stack Type**: Define the stack type (either `IPv4` or `IPv6`) for network peering configurations.
- **Dependencies Management**: Uses the `null_resource` to manage dependencies and ensure the correct order of resource creation.
- **Bidirectional Peering**: Creates peering in both directions, i.e., from local network to peer network and from peer network to local network.

## Pre-requisites

Before using this module, ensure the following:

- You must have a Google Cloud project created.
- Google Cloud provider configured for Terraform (`google` or `google_beta`).
- Terraform 1.x or higher installed.
- Existing Google Cloud VPCs must be available for peering (you will need to specify the networks to peer).
- Proper IAM permissions to create and manage `google_compute_network_peering` resources.

## Inputs

| Name                                    | Description                                                                                        | Type        | Default       | Required |
|-----------------------------------------|----------------------------------------------------------------------------------------------------|-------------|---------------|----------|
| `local_network`                         | The self-link or name of the local network (VPC) for the peering connection.                       | `string`    | n/a           | yes      |
| `peer_network`                          | The self-link or name of the peer network (VPC) to peer with the local network.                    | `string`    | n/a           | yes      |
| `prefix`                                | A prefix string to be used in the naming of the peering connections.                               | `string`    | "vpc"         | yes      |
| `export_local_custom_routes`            | Whether to export custom routes from the local network to the peer network.                        | `bool`      | `false`       | no       |
| `export_peer_custom_routes`             | Whether to export custom routes from the peer network to the local network.                        | `bool`      | `false`       | no       |
| `export_subnet_routes_with_public_ip`   | Whether to export subnet routes that have public IPs.                                              | `bool`      | `false`       | no       |
| `import_local_custom_routes`            | Whether to import custom routes from the local network to the peer network.                        | `bool`      | `false`       | no       |
| `import_peer_custom_routes`             | Whether to import custom routes from the peer network to the local network.                        | `bool`      | `false`       | no       |
| `import_subnet_routes_with_public_ip`   | Whether to import subnet routes that have public IPs.                                              | `bool`      | `false`       | no       |
| `stack_type`                            | The stack type to be used for the peering connection (`IPv4` or `IPv6`).                           | `string`    | `IPv4`        | no       |
| `module_depends_on`                     | A list of dependencies that should be resolved before creating the network peering.                | `list(any)` | []            | no       |

## Outputs

| Name                                    | Description                                                                                       |
|-----------------------------------------|---------------------------------------------------------------------------------------------------|
| `local_network_peering_name`            | The name of the local network peering resource.                                                   |
| `peer_network_peering_name`             | The name of the peer network peering resource.                                                    |
| `module_depends_on`                     | The resolved value of module dependencies, ensuring proper resource creation order.               |

## Contacts and Contributing

If you encounter any issues or have questions, feel free to reach out to the module maintainers or contribute improvements by opening a GitHub issue or pull request.

- **Author**: [Your Name or Organization]
- **GitHub Repository**: [URL to GitHub repo]
- **License**: [Insert license type here]

Contributions are always welcome! Please follow the standard [GitHub contribution workflow](https://github.com/firstcontribution/first-contributions) for submitting pull requests.

---

Happy Cloud Networking!
