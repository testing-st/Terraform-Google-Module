# Google Cloud Route Module

## Overview

This Terraform module is designed to create custom routes in Google Cloud VPC networks. Routes define how packets are directed from one network to another, and this module allows you to set up routes with various next-hop configurations. These configurations can include next-hop gateways, instances, VPN tunnels, or internal load balancers (ILB). It is ideal for routing traffic between VPC networks, subnets, or external destinations.

With this module, you can configure routes with fine-grained control over priority, tags, and the next-hop configurations required for routing traffic in your Google Cloud environment.

## Features

- **Custom Route Creation**: Easily create routes in Google Cloud for directing traffic to various destinations.
- **Multiple Next-Hop Options**: Support for multiple next-hop types including gateways, instances, IPs, VPN tunnels, and ILBs.
- **Priority & Tags**: Configure route priority and tags for better management and organization.
- **Network Integration**: Integrate routes into your existing Google Cloud VPC networks and customize their behavior.
- **Dynamic Configuration**: Dynamically configure route properties such as destination range, description, and next-hop configurations.

## Pre-requisites

Before using this module, ensure the following:

- A Google Cloud Project where the route will be created.
- A VPC network in which the route will be configured.
- Terraform installed (version 0.12 or later).
- A valid Google Cloud authentication setup (e.g., using service account credentials).
- The `google` provider configured in your Terraform setup.

## Inputs

| Variable Name              | Type     | Description                                                                  | Default |
|----------------------------|----------|------------------------------------------------------------------------------|---------|
| `dest_range`               | string   | The destination IP range for the route.                                      | -       |
| `name`                     | string   | The name of the route.                                                       | -       |
| `network`                  | string   | The network in which the route will be created.                              | -       |
| `description`              | string   | A description for the route.                                                 | -       |
| `priority`                 | number   | The priority of the route. Lower numbers have higher priority.               | 1000    |
| `tags`                     | list     | The network tags associated with the route.                                  | []      |
| `next_hop_gateway`         | string   | The next hop gateway for the route (optional).                               | null    |
| `next_hop_instance`        | string   | The next hop instance for the route (optional).                              | null    |
| `next_hop_ip`              | string   | The next hop IP address for the route (optional).                            | null    |
| `next_hop_vpn_tunnel`      | string   | The next hop VPN tunnel for the route (optional).                            | null    |
| `next_hop_ilb`             | string   | The next hop internal load balancer (ILB) for the route (optional).          | null    |
| `project_id`               | string   | The Google Cloud Project ID where the route will be created.                 | -       |
| `next_hop_instance_zone`   | string   | The zone of the next hop instance (optional).                                | null    |

## Outputs

| Output Name               | Description                                                  |
|---------------------------|--------------------------------------------------------------|
| `route_name`              | The name of the created route.                               |
| `route_self_link`         | The self-link URL for the created route.                     |

## Contacts and Contributing

If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Make your changes.
4. Submit a pull request with a description of your changes.

For any issues or inquiries, please open an issue in the GitHub repository.

### Maintainers:

- [Your Name] - [your.email@example.com]

## License

This module is released under the [MIT License](LICENSE).
