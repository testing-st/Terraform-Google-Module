# Google Service Networking Connection Module

This Terraform module configures a Google Service Networking connection between a specified network and a service, allowing the network to access specific Google Cloud services over private IP addresses. It supports reserved peering ranges and manages deletion and update policies for the service connection.

## Overview

This module provisions a `google_service_networking_connection` resource that connects a VPC (Virtual Private Cloud) network with a specific Google Cloud service, using private IPs for communication. The connection can be configured to reserve peering ranges, set a deletion policy, and specify how the connection should behave during creation failures.

## Features

- **Service Networking**: Connect your VPC to a Google Cloud service over private IPs using Google Service Networking.
- **Reserved Peering Ranges**: Reserve specific IP ranges for peering between your VPC and the service.
- **Custom Deletion Policy**: Control the deletion behavior of the service connection.
- **Update Behavior**: Control the update behavior of the service connection when creation fails.
- **Support for Google Cloud Services**: Integrates with various Google Cloud services requiring VPC peering, such as Cloud SQL, Private Google Access, and more.

## Pre-requisites

Before using this module, ensure the following:

- You must have a Google Cloud project created.
- Google Cloud provider configured for Terraform (`google` or `google_beta`).
- Terraform 1.x or higher installed.
- A Google Cloud VPC network must already be created (this network will be connected to the service).
- The service to which you are connecting must be available and supported for service networking (e.g., Cloud SQL, Private Google Access).
- Proper IAM permissions to create and manage `google_service_networking_connection` resources.

## Inputs

| Name                         | Description                                                                    | Type           | Default   | Required |
|------------------------------|--------------------------------------------------------------------------------|----------------|-----------|----------|
| `network`                     | The name or self-link of the VPC network that will connect to the service.    | `string`       | n/a       | yes      |
| `service`                     | The name of the Google Cloud service to connect to (e.g., `googleapis.com`).  | `string`       | n/a       | yes      |
| `ranges`                       | List of reserved peering IP ranges for the service connection.               | `list(string)` | []        | yes      |
| `deletion_policy`             | The deletion policy for the service connection (e.g., `ABANDON` or `DELETE`). | `string`       | "DELETE"  | no       |
| `update_on_creation_fail`     | Whether to update the connection if creation fails (default is `false`).      | `bool`         | `false`   | no       |

## Outputs

| Name                         | Description                                                               |
|------------------------------|---------------------------------------------------------------------------|
| `network`                     | The network associated with the service connection.                      |
| `service`                     | The service that is connected to the VPC network.                        |
| `reserved_peering_ranges`     | The reserved IP ranges for the peering connection.                       |
| `deletion_policy`             | The deletion policy set for the service connection.                      |
| `update_on_creation_fail`     | The update behavior set for the connection if creation fails.            |

## Contacts and Contributing

If you encounter any issues or have questions, feel free to reach out to the module maintainers or contribute improvements by opening a GitHub issue or pull request.

- **Author**: [Your Name or Organization]
- **GitHub Repository**: [URL to GitHub repo]
- **License**: [Insert license type here]

Contributions are always welcome! Please follow the standard [GitHub contribution workflow](https://github.com/firstcontribution/first-contributions) for submitting pull requests.

---

Happy Cloud Networking!
