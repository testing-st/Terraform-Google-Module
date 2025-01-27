# Terraform Google Compute Network Attachment Module

## Overview
This Terraform module provisions a Google Compute Network Attachment (`google_compute_network_attachment`). Network attachments are used to connect a VM instance to multiple Virtual Private Cloud (VPC) networks, providing the ability to manage network connections at a granular level. This module allows configuration of connection preferences, subnetwork attachments, and associated network policies.

## Features
- Creates a Google Compute Network Attachment for attaching VMs to multiple networks.
- Allows configuration of connection preferences, including accept and reject lists for producers.
- Enables the specification of subnetworks and region for the network attachment.
- Customizable name and description for the network attachment.
- Supports multiple producer accept and reject lists for better network control.

## Pre-requisites
- A GCP project with permissions to create and manage Compute resources.
- Existing subnetworks that the network attachment will connect to.
- Understanding of network policies like producer accept and reject lists, and connection preferences.

## Inputs

| Name                     | Description                                                                                   | Type   | Default            | Required |
|--------------------------|-----------------------------------------------------------------------------------------------|--------|--------------------|----------|
| `project_id`              | The GCP project ID in which the resources will be created.                                   | string | N/A                | Yes      |
| `name`                    | The name of the network attachment.                                                          | string | N/A                | Yes      |
| `region`                  | The region in which the network attachment will be created.                                  | string | N/A                | Yes      |
| `description`             | A description for the network attachment.                                                    | string | N/A                | No       |
| `subnetworks`             | A list of subnetworks that the network attachment will connect to.                           | list   | N/A                | Yes      |
| `connection_preference`   | The connection preference for the network attachment (e.g., "ACCEPT_AUTOMATIC" or "REJECT"). | string | "ACCEPT_AUTOMATIC" | No       |
| `producer_reject_lists`   | A list of producer reject lists for the network attachment.                                  | list   | []                 | No       |
| `producer_accept_lists`   | A list of producer accept lists for the network attachment.                                  | list   | []                 | No       |

## Outputs

| Name                | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `network_attachment_id` | The ID of the created network attachment.                               |

## Contacts and Contributing

For support or questions, please contact us via the following channels:
- Email: support@example.com
- GitHub Issues: https://github.com/example/repository/issues

We encourage contributions to this module! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your changes.
3. Ensure your changes do not break existing functionality.
4. Submit a pull request with a detailed description of the changes made.
