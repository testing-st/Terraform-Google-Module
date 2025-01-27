# Google Network Connectivity Spoke Terraform Module

## Overview

This Terraform module creates and configures a Google Cloud Network Connectivity Spoke, which is part of the Network Connectivity Center. The spoke connects various resources, such as VPN tunnels, interconnect attachments, router appliances, VPC networks, and producer VPC networks, to a central hub. This configuration enables centralized and secure communication between different parts of your network.

## Features

- Supports linking VPN tunnels, interconnect attachments, router appliances, and VPC networks to a central hub.
- Configurable for various dynamic configurations of linked resources.
- Provides flexibility in importing and exporting IP ranges for VPN and interconnect attachments.
- Allows the integration of multiple VPC networks and producer VPC networks with include/exclude export range capabilities.
- Configurable with detailed options for site-to-site data transfer for each linked resource.

## Pre-requisites

Before using this module, ensure that:

1. You have a Google Cloud Platform (GCP) account with the necessary IAM permissions to create and manage Network Connectivity Spokes and associated resources.
2. The `google` provider is configured with appropriate credentials.
3. A Connectivity Hub is already created, as the spoke will need to be linked to it.
4. Existing resources, such as VPN tunnels, interconnect attachments, VPC networks, and router appliance instances, are ready for linking.
5. Ensure that all referenced resources (VPNs, interconnects, appliances, etc.) are properly configured in your Google Cloud environment.

## Inputs

| Name                               | Description                                                                                                             | Type   | Default | Required |
|------------------------------------|-------------------------------------------------------------------------------------------------------------------------|--------|---------|----------|
| `name`                             | The name of the Network Connectivity Spoke.                                                                             | string | -       | yes      |
| `hub`                              | The ID of the Connectivity Hub to which the spoke is connected.                                                         | string | -       | yes      |
| `location`                         | The location where the spoke is created.                                                                                | string | -       | yes      |
| `labels`                           | Labels for categorizing the spoke.                                                                                      | map    | {}      | no       |
| `description`                      | A description of the Network Connectivity Spoke.                                                                        | string | -       | no       |
| `linked_vpn_tunnels`               | List of VPN tunnels to be linked to the spoke, with configuration options like `uris` and `site_to_site_data_transfer`. | list   | []      | no       |
| `linked_interconnect_attachments`  | List of interconnect attachments to link, with configuration options such as `uris` and `site_to_site_data_transfer`.   | list   | []      | no       |
| `linked_router_appliance_instances`| List of router appliance instances to link, with configurable instance details like `virtual_machine` and `ip_address`. | list   | []      | no       |
| `linked_vpc_network`               | List of VPC networks to be linked to the spoke, with export and import range options.                                   | list   | []      | no       |
| `linked_producer_vpc_network`      | List of producer VPC networks to be linked to the spoke, with options for including or excluding export ranges.         | list   | []      | no       |
| `project`                          | The GCP project ID where the spoke is created.                                                                          | string | -       | yes      |

## Outputs

| Name                               | Description                                                          |
|------------------------------------|----------------------------------------------------------------------|
| `spoke_id`                         | The ID of the created Network Connectivity Spoke.                    |
| `spoke_name`                       | The name of the created Network Connectivity Spoke.                  |
| `linked_resources`                 | List of all linked resources, such as VPNs, interconnects, and VPCs. |

## Contacts and Contributing

For any issues, questions, or contributions to this module:

- **Contact Email**: support@example.com
- **Contributing**: Feel free to open a pull request with any improvements or fixes. Please ensure that you follow the contribution guidelines and ensure tests are in place where appropriate.
