# Google Compute Interconnect Attachment Terraform Module

## Overview

This Terraform module manages the creation and configuration of a Google Cloud Compute Interconnect Attachment. The interconnect attachment enables you to connect your interconnect resource to a router, defining the settings related to the bandwidth, MTU, VLAN tagging, and encryption among other configurations. It supports the setup of secure IPsec connections for enhanced network security.

## Features

- Supports configuring interconnect attachment to link a router and interconnect.
- Customizable settings for MTU, bandwidth, and VLAN tags.
- Supports configuration of candidate subnets for attachment.
- Option to enable IPsec and encryption for secure communication.
- Flexible configurations for edge availability domains and stack types.
- Configurable subnet length, region, and project details.
- Dynamic support for various types of interconnect attachments.

## Pre-requisites

Before using this module, ensure that:

1. You have a Google Cloud Platform (GCP) account and the necessary IAM permissions to create Interconnect Attachment resources.
2. The `google` provider is correctly configured with appropriate credentials.
3. Ensure that you have already created a `google_compute_interconnect` resource to which this attachment will be linked.
4. The router specified in the module already exists.

## Inputs

| Name                          | Description                                                                                       | Type   | Default  | Required |
|-------------------------------|---------------------------------------------------------------------------------------------------|--------|----------|----------|
| `router_output_id`            | The ID of the router to which the interconnect attachment will be linked.                         | string | -        | yes      |
| `interconnect_attachment_name`| The name of the interconnect attachment.                                                          | string | -        | yes      |
| `admin_enabled`               | Whether the interconnect attachment is administratively enabled.                                  | bool   | -        | yes      |
| `interconnect`                | The ID of the interconnect resource.                                                              | string | -        | yes      |
| `description`                 | A description of the interconnect attachment.                                                     | string | -        | no       |
| `mtu`                         | Maximum Transmission Unit (MTU) for the attachment.                                               | number | 1500     | no       |
| `bandwidth`                   | The bandwidth for the attachment.                                                                 | string | -        | yes      |
| `edge_availability_domain`    | The availability domain at the edge of the interconnect.                                          | string | -        | yes      |
| `type`                        | The type of the interconnect attachment (e.g., `CLOUD`, `ENTERPRISE`).                            | string | -        | yes      |
| `candidate_subnets`           | List of candidate subnets for the attachment.                                                     | list   | []       | no       |
| `vlan_tag8021q`               | The VLAN tag for 802.1q encapsulation on the attachment.                                          | number | -        | yes      |
| `ipsec_internal_addresses`    | List of internal IP addresses for IPsec.                                                          | list   | []       | no       |
| `encryption`                  | Whether encryption is enabled for the attachment.                                                 | bool   | false    | no       |
| `stack_type`                  | The stack type for the attachment (e.g., `IPV4`, `IPV6`).                                         | string | -        | yes      |
| `subnet_length`               | The subnet length for the attachment.                                                             | number | -        | yes      |
| `region`                      | The region where the attachment is created.                                                       | string | -        | yes      |
| `project`                     | The GCP project in which the interconnect attachment is created.                                  | string | -        | yes      |

## Outputs

| Name                           | Description                                                           |
|--------------------------------|-----------------------------------------------------------------------|
| `interconnect_attachment_id`   | The ID of the created interconnect attachment.                        |
| `interconnect_attachment_name` | The name of the created interconnect attachment.                      |
| `ipsec_internal_addresses`     | The internal IP addresses used for IPsec on the attachment.           |
| `encryption_status`            | Whether encryption is enabled or not for the attachment.              |

## Contacts and Contributing

For any issues, questions, or contributions to this module:

- **Contact Email**: support@example.com
- **Contributing**: Feel free to open a pull request with any improvements or fixes. Please make sure to follow the contribution guidelines and ensure tests are in place where appropriate.
