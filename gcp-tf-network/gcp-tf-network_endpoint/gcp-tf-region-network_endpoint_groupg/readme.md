# Google Compute Region Network Endpoint Group and Region Network Endpoint Terraform Modules

## Overview

This Terraform module creates and manages Google Cloud Region Network Endpoint Groups (REGs) and Region Network Endpoints. Region Network Endpoint Groups are used to define the set of network endpoints (e.g., Cloud Run, App Engine, Cloud Functions, etc.) that can be used for regional load balancing in Google Cloud.

The module provides the ability to configure and link different types of serverless deployments and private services for load balancing.

## Features

- Creates and manages Google Cloud Region Network Endpoint Groups (REGs) and associated Region Network Endpoints.
- Supports integration with various Google Cloud services like Cloud Run, App Engine, Cloud Functions, and serverless deployments.
- Configurable network endpoint types such as `PRIVATE_SERVICE_CONNECT`, `INTERNET_IP_PORT`, and `INTERNET_FQDN_PORT`.
- Dynamic configuration for attaching Cloud Run, App Engine, and Cloud Functions services to the network endpoint group.
- Flexible settings for service URLs, versions, and masks.
- Support for both FQDN-based and IP-based network endpoints.

## Pre-requisites

Before using this module, ensure that:

1. You have a Google Cloud Platform (GCP) account with the necessary IAM permissions to create and manage Region Network Endpoint Groups and Region Network Endpoints.
2. The `google-beta` provider is configured with appropriate credentials for creating regional resources.
3. The VPC network and subnetwork you want to use for private service connections already exist.
4. Ensure that the Cloud Run, App Engine, and Cloud Function services are already created if they are to be linked to the REG.
5. Ensure that the specified region supports the services and deployments you intend to use.

## Inputs

| Name                          | Description                                                                                             | Type   | Default | Required |
|-------------------------------|---------------------------------------------------------------------------------------------------------|--------|---------|----------|
| `neg_name`                     | The name of the Region Network Endpoint Group (REG).                                                   | string | -       | yes      |
| `region`                       | The region where the REG and its associated endpoints will be created.                                 | string | -       | yes      |
| `description`                  | A description for the Region Network Endpoint Group.                                                   | string | -       | no       |
| `network_endpoint_type`        | The type of network endpoint (`PRIVATE_SERVICE_CONNECT`, `INTERNET_IP_PORT`, or `INTERNET_FQDN_PORT`). | string | -       | yes      |
| `psc_target_service`           | The target service for the PSC (if applicable, depends on the endpoint type).                          | string | -       | no       |
| `network`                      | The network for the target service (if using `PRIVATE_SERVICE_CONNECT` as endpoint type).              | string | -       | no       |
| `subnetwork`                   | The subnetwork to use for `PRIVATE_SERVICE_CONNECT` endpoints.                                         | string | -       | no       |
| `cloud_run`                    | List of Cloud Run services to link to the REG. Includes service name, tag, and URL mask.               | list   | []      | no       |
| `app_engine`                   | List of App Engine services to link to the REG. Includes service name, version, and URL mask.          | list   | []      | no       |
| `cloud_function`               | List of Cloud Function services to link to the REG. Includes function name and URL mask.               | list   | []      | no       |
| `serverless_deployment`        | List of serverless deployments to link to the REG. Includes platform, resource, version, and URL mask. | list   | []      | no       |
| `project_id`                   | The GCP project ID where the REG and network endpoints are created.                                    | string | -       | yes      |
| `create_endpoint`              | Flag to determine whether a network endpoint should be created.                                        | bool   | false   | no       |
| `port`                         | The port for the network endpoint (if creating an endpoint).                                           | number | -       | no       |
| `ip_address`                   | The static IP address for the network endpoint (if creating an endpoint).                              | string | -       | no       |
| `fqdn`                         | The Fully Qualified Domain Name (FQDN) for the network endpoint (if creating an endpoint).             | string | -       | no       |

## Outputs

| Name                                 | Description                                                                 |
|--------------------------------------|-----------------------------------------------------------------------------|
| `region_network_endpoint_group_id`   | The ID of the created Region Network Endpoint Group (REG).                  |
| `region_network_endpoint_group_name` | The name of the created Region Network Endpoint Group (REG).                |
| `region_network_endpoint_ids`        | The IDs of the created Region Network Endpoints.                            |
| `region_network_endpoints_details`   | A list of details for all created region network endpoints (IP, FQDN, port).|

## Contacts and Contributing

For any issues, questions, or contributions to this module:

- **Contact Email**: support@example.com
- **Contributing**: Feel free to open a pull request with any improvements or fixes. Please ensure that you follow the contribution guidelines and ensure tests are in place where appropriate.
