# Google Compute Router Module

This Terraform module provisions a Google Compute Router in Google Cloud Platform (GCP). The module enables you to configure the router with BGP (Border Gateway Protocol) settings, network and region configurations, and optional encrypted interconnect routers.

## Overview

This module allows you to create and manage a Google Compute Router, which is a key component for establishing dynamic routing between Google Cloud networks and external networks (e.g., on-premises networks or other cloud environments). You can configure BGP settings, including ASN (Autonomous System Number), advertised IP ranges, and keepalive intervals for more control over routing.

## Features

- **BGP Configuration**: Allows configuration of multiple BGP sessions with customizable settings like ASN, advertise mode, advertised IP ranges, and more.
- **Encrypted Interconnect Router**: Option to enable encryption for interconnect routers.
- **Region and Network Configuration**: Specify the region and network to associate with the router.
- **Flexible and Dynamic Router Settings**: Configure multiple BGP sessions dynamically with support for multiple advertised IP ranges.
- **Descriptive Configuration**: Include descriptions for routing configurations, providing clarity in network setups.

## Pre-requisites

Before using this module, ensure the following:

- You must have a Google Cloud project created.
- Google Cloud provider configured for Terraform (`google` or `google_beta`).
- Terraform 1.x or higher installed.
- The Google Cloud Network must already exist or be created separately before using this module.
- Ensure BGP is supported and required for your networking setup.

## Inputs

| Name                               | Description                                                               | Type           | Default | Required |
|------------------------------------|-------------------------------------------------------------------------- |----------------|---------|----------|
| `router_name`                      | The name of the router to be created.                                     | `string`       | n/a     | yes      |
| `network`                          | The name or self-link of the network to which the router is connected.    | `string`       | n/a     | yes      |
| `router_description`               | A description for the router resource.                                    | `string`       | ""      | no       |
| `bgp`                              | A list of BGP configuration objects.                                      | `list(object)` | []      | no       |
| `bgp.asn`                          | The ASN (Autonomous System Number) for the BGP session.                   | `number`       | n/a     | yes      |
| `bgp.advertise_mode`               | The mode in which IP ranges are advertised by BGP.                        | `string`       | n/a     | yes      |
| `bgp.advertised_groups`            | The advertised BGP groups.                                                | `list(string)` | []      | no       |
| `bgp.advertised_ip_ranges`         | A list of advertised IP ranges with their descriptions.                   | `list(object)` | []      | no       |
| `bgp.keepalive_interval`           | The interval in seconds between BGP keepalive messages.                   | `number`       | 60      | no       |
| `bgp.identifier_range`             | The identifier range used by BGP.                                         | `string`       | n/a     | yes      |
| `encrypted_interconnect_router`    | A boolean flag to enable encrypted interconnect routers.                  | `bool`         | false   | no       |
| `region`                           | The region where the router will be deployed.                             | `string`       | n/a     | yes      |
| `project_id`                       | The Google Cloud project ID.                                              | `string`       | n/a     | yes      |

## Outputs

| Name                               | Description                                                              |
|------------------------------------|--------------------------------------------------------------------------|
| `router_name`                      | The name of the created router.                                          |
| `router_region`                    | The region in which the router was created.                              |
| `router_network`                   | The network associated with the router.                                  |
| `bgp_settings`                     | The list of BGP configurations applied to the router.                    |
| `encrypted_interconnect_router`    | Indicates if the encrypted interconnect router is enabled or not.        |

## Contacts and Contributing

If you encounter any issues or have questions, feel free to reach out to the module maintainers or contribute improvements by opening a GitHub issue or pull request.

- **Author**: [Your Name or Organization]
- **GitHub Repository**: [URL to GitHub repo]
- **License**: [Insert license type here]

Contributions are always welcome! Please follow the standard [GitHub contribution workflow](https://github.com/firstcontribution/first-contributions) for submitting pull requests.

---

Happy Networking!
