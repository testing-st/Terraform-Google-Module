# Google VPC Access Connector Terraform Module

## Overview

This Terraform module creates and configures a Google Cloud VPC Access Connector, which enables you to create a serverless VPC access gateway between your VPC network and Google Cloud's serverless environments (e.g., Cloud Functions, Cloud Run, App Engine). The VPC Access Connector allows serverless workloads to connect to resources in your VPC network securely and efficiently.

## Features

- Creates a VPC Access Connector with customizable configurations.
- Configurable machine type and instance count to meet throughput requirements.
- Dynamic support for linking multiple subnets for the connector.
- Configurable IP CIDR range to ensure proper network segmentation.
- Support for specifying minimum and maximum throughput to optimize performance.
- Flexible region and project configuration for deployment.

## Pre-requisites

Before using this module, ensure that:

1. You have a Google Cloud Platform (GCP) account with the necessary IAM permissions to create and manage VPC Access Connectors.
2. The `google` provider is configured with appropriate credentials.
3. A VPC network already exists, which the VPC Access Connector will be linked to.
4. Ensure that the CIDR range provided does not overlap with other ranges in the VPC network.
5. The specified region supports the VPC Access Connector service.

## Inputs

| Name                 | Description                                                                                        | Type   | Default     | Required |
|----------------------|----------------------------------------------------------------------------------------------------|--------|-------------|----------|
| `name`               | The name of the VPC Access Connector.                                                              | string | -           | yes      |
| `network`            | The ID of the VPC network to which the connector is attached.                                      | string | -           | yes      |
| `ip_cidr_range`      | The IP CIDR range to be used by the connector (should be within the VPC's IP range).               | string | -           | yes      |
| `machine_type`       | The machine type for the connector (e.g., `e2-micro`, `e2-small`).                                 | string | `e2-medium` | no       |
| `min_throughput`     | The minimum throughput of the connector (in Mbps).                                                 | number | 200         | no       |
| `min_instances`      | The minimum number of instances for the connector.                                                 | number | 1           | no       |
| `max_instances`      | The maximum number of instances for the connector.                                                 | number | 10          | no       |
| `max_throughput`     | The maximum throughput of the connector (in Mbps).                                                 | number | 2000        | no       |
| `subnet`             | List of subnets (with project IDs) to attach to the VPC Access Connector.                          | list   | []          | no       |
| `region`             | The region where the VPC Access Connector will be created.                                         | string | -           | yes      |
| `project`            | The GCP project ID in which the VPC Access Connector will be created.                              | string | -           | yes      |

## Outputs

| Name                   | Description                                                           |
|------------------------|-----------------------------------------------------------------------|
| `vpc_access_connector_id` | The ID of the created VPC Access Connector.                        |
| `vpc_access_connector_name` | The name of the created VPC Access Connector.                    |
| `subnets`               | A list of the attached subnets to the VPC Access Connector.          |

## Contacts and Contributing

For any issues, questions, or contributions to this module:

- **Contact Email**: support@example.com
- **Contributing**: Feel free to open a pull request with any improvements or fixes. Please ensure that you follow the contribution guidelines and ensure tests are in place where appropriate.
