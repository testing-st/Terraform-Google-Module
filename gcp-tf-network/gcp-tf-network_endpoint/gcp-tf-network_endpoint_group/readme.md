# Google Compute Network Endpoint Group and Network Endpoint Terraform Modules

## Overview

This Terraform module helps you create and manage Google Cloud Network Endpoint Groups (NEGs) and their associated Network Endpoints. A Network Endpoint Group (NEG) is a GCP resource that allows you to define the set of network endpoints (such as VM instances or external IPs) that can be used for load balancing in Google Cloud.

The module provides the flexibility to create network endpoints dynamically, either by specifying the endpoint details explicitly or through a list of network endpoints.

## Features

- Creates and manages Google Cloud Network Endpoint Groups (NEGs).
- Supports dynamic creation of Network Endpoints for load balancing purposes.
- Option to link network endpoints to the NEG using either instances or static IP addresses.
- Configurable properties like endpoint type, description, subnetwork, and port.
- Supports flexible configurations for zone and project.

## Pre-requisites

Before using this module, ensure that:

1. You have a Google Cloud Platform (GCP) account and the necessary IAM permissions to create and manage Network Endpoint Groups and Network Endpoints.
2. The `google` provider is correctly configured with appropriate credentials.
3. The VPC network and subnetwork you want to use already exist.
4. If using instances as endpoints, the virtual machines should be pre-provisioned in the specified zone.
5. Ensure that the IP addresses or instances you want to use as endpoints are correctly specified.

## Inputs

| Name                         | Description                                                                                          | Type   | Default | Required |
|------------------------------|------------------------------------------------------------------------------------------------------|--------|---------|----------|
| `neg_name`                    | The name of the Network Endpoint Group (NEG).                                                       | string | -       | yes      |
| `network_name`                | The name of the network where the NEG is created.                                                   | string | -       | yes      |
| `description`                 | A description for the NEG.                                                                          | string | -       | no       |
| `network_endpoint_type`       | The type of the network endpoint (e.g., `GCE_VM_IP_PORT`).                                          | string | -       | yes      |
| `subnetwork`                  | The subnetwork to which the NEG is attached.                                                        | string | -       | yes      |
| `default_port`                | The default port to be used for the network endpoints.                                              | number | -       | yes      |
| `zone`                        | The zone where the NEG and associated endpoints will be created.                                    | string | -       | yes      |
| `project_id`                  | The GCP project ID where the NEG is created.                                                        | string | -       | yes      |
| `create_endpoints`            | Whether to create the network endpoints.                                                            | bool   | true    | no       |
| `create_endpoint`             | Whether to create a single endpoint manually.                                                       | bool   | false   | no       |
| `ip_address`                  | The static IP address for the network endpoint if manually creating an endpoint.                    | string | -       | no       |
| `instance`                    | The instance that will be linked to the network endpoint.                                           | string | -       | no       |
| `port`                        | The port for the network endpoint.                                                                  | number | -       | no       |
| `network_endpoints`           | A list of dynamic network endpoints (each consisting of `instance`, `port`, `ip_address`).          | list   | []      | no       |

## Outputs

| Name                           | Description                                                                |
|--------------------------------|----------------------------------------------------------------------------|
| `network_endpoint_group_id`    | The ID of the created Network Endpoint Group.                             |
| `network_endpoint_group_name`  | The name of the created Network Endpoint Group.                           |
| `network_endpoints_ids`        | The IDs of the created Network Endpoints.                                 |
| `network_endpoints_details`    | A list of details for all created network endpoints (instance, IP, port). |

## Contacts and Contributing

For any issues, questions, or contributions to this module:

- **Contact Email**: support@example.com
- **Contributing**: Feel free to open a pull request with any improvements or fixes. Please ensure that you follow the contribution guidelines and ensure tests are in place where appropriate.
