# Google Compute Interconnect Terraform Module

## Overview

This Terraform module manages the creation and configuration of a Google Cloud Compute Interconnect resource. The interconnect allows you to establish a high-performance, dedicated connection between your on-premises network and Google Cloud. The module allows you to define parameters such as link type, interconnect type, and security features like MACsec (Media Access Control Security).

## Features

- Supports multiple types of interconnect (e.g., Dedicated, Partner).
- Allows the configuration of link type, requested link count, and other interconnect settings.
- Dynamic MACsec configuration for secure communication.
- Option to enable or disable MACsec encryption.
- Provides support for configuring and managing pre-shared keys for MACsec.
- Configurable metadata and labels for the interconnect.
- Flexible inputs for interconnect settings, including administrative and location-specific details.

## Pre-requisites

Before using this module, ensure that:

1. You have a Google Cloud Platform (GCP) account and the necessary IAM permissions to create Interconnect resources.
2. The `google` provider is correctly configured with appropriate credentials.
3. Ensure that the interconnect configuration complies with your networking architecture and requirements.

## Inputs

| Name                     | Description                                                                                        | Type   | Default  | Required |
|--------------------------|----------------------------------------------------------------------------------------------------|--------|----------|----------|
| `interconnect_name`      | The name of the interconnect.                                                                      | string | -        | yes      |
| `link_type`              | The type of the interconnect link.                                                                 | string | -        | yes      |
| `requested_link_count`   | The number of links requested for the interconnect.                                                | number | -        | yes      |
| `interconnect_type`      | The interconnect type (e.g., Dedicated, Partner).                                                  | string | -        | yes      |
| `description`            | A description of the interconnect.                                                                 | string | -        | no       |
| `location`               | The location of the interconnect.                                                                  | string | -        | yes      |
| `admin_enabled`          | Whether the interconnect is administratively enabled.                                              | bool   | -        | yes      |
| `noc_contact_email`      | The email address of the NOC contact for the interconnect.                                         | string | -        | yes      |
| `customer_name`          | The customer name associated with the interconnect.                                                | string | -        | yes      |
| `labels`                 | Labels for categorizing the interconnect.                                                          | map    | {}       | no       |
| `macsec`                 | Configuration for MACsec, including pre-shared keys and security settings.                         | list   | []       | no       |
| `macsec_enabled`         | Whether MACsec encryption is enabled for the interconnect.                                         | bool   | false    | no       |
| `remote_location`        | The remote location for the interconnect.                                                          | string | -        | no       |
| `requested_features`     | Additional requested features for the interconnect.                                                | list   | []       | no       |
| `project`                | The GCP project where the interconnect is being created.                                           | string | -        | yes      |

## Outputs

| Name                   | Description                                                           |
|------------------------|-----------------------------------------------------------------------|
| `interconnect_id`      | The ID of the created interconnect resource.                         |
| `interconnect_name`    | The name of the created interconnect resource.                       |
| `macsec_status`        | The MACsec status (enabled/disabled) of the interconnect.            |

## Contacts and Contributing

For any issues, questions, or contributions to this module:

- **Contact Email**: support@example.com

- **Contributing**: Feel free to open a pull request with any improvements or fixes. Please make sure to follow the contribution guidelines and ensure tests are in place where appropriate.
