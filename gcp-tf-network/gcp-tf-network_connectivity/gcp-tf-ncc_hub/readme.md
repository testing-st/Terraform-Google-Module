# Google Network Connectivity Hub Terraform Module

## Overview

This Terraform module manages the creation and configuration of a Google Cloud Network Connectivity Hub. The Connectivity Hub enables you to centralize and manage your network connectivity by connecting your different Google Cloud resources, such as Virtual Private Clouds (VPCs), with external or partner networks. This module supports configuring key properties such as the hub's name, description, labels, and the option to export Private Service Connect (PSC).

## Features

- Centralized network connectivity management for Google Cloud resources.
- Option to configure a description for the hub.
- Supports project-specific configuration.
- Allows the addition of labels for categorizing and organizing hubs.
- Configurable export of Private Service Connect (PSC) for routing traffic to specific Google services.

## Pre-requisites

Before using this module, ensure that:

1. You have a Google Cloud Platform (GCP) account with the necessary IAM permissions to create and manage Network Connectivity Hubs.
2. The `google` provider is correctly configured with appropriate credentials.
3. A project already exists where the Connectivity Hub will be created.
4. Ensure that you have a proper network architecture that benefits from using the Network Connectivity Hub (e.g., multiple VPCs needing centralized connectivity).

## Inputs

| Name                | Description                                                                                         | Type   | Default | Required |
|---------------------|-----------------------------------------------------------------------------------------------------|--------|---------|----------|
| `hub_name`          | The name of the Network Connectivity Hub.                                                           | string | -       | yes      |
| `description`       | A description of the Network Connectivity Hub.                                                      | string | -       | no       |
| `project_id`        | The GCP project ID where the hub will be created.                                                   | string | -       | yes      |
| `labels`            | Labels to organize and categorize the hub.                                                          | map    | {}      | no       |
| `export_psc`        | Whether the Connectivity Hub should export Private Service Connect (PSC).                           | bool   | false   | no       |

## Outputs

| Name                   | Description                                                           |
|------------------------|-----------------------------------------------------------------------|
| `hub_id`               | The ID of the created Network Connectivity Hub.                       |
| `hub_name`             | The name of the created Network Connectivity Hub.                     |
| `export_psc_status`    | The status indicating whether PSC export is enabled or not.           |

## Contacts and Contributing

For any issues, questions, or contributions to this module:

- **Contact Email**: support@example.com
- **Contributing**: Feel free to open a pull request with any improvements or fixes. Please make sure to follow the contribution guidelines and ensure tests are in place where appropriate.
