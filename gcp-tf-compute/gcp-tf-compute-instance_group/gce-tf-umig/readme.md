# Terraform Google Compute Instance Group Module

## Overview
This Terraform module provisions a Google Cloud Compute Instance Group (`google_compute_instance_group`). The instance group can contain multiple VM instances and supports configuring named ports. It allows you to define instances dynamically and specify a network for the group.

## Features
- Creates a Google Cloud Compute Instance Group (`google_compute_instance_group`).
- Configures named ports for instance group members.
- Supports dynamic assignment of VM instances.
- Supports custom network configuration for the instance group.
- Configurable description and name for the instance group.

## Pre-requisites
- A GCP project with permissions to create compute resources.
- A pre-existing network for the instance group to be associated with.
- Pre-existing VM instances or a method to dynamically add instances to the group.

## Inputs

| Name                       | Description                                                                                             | Type   | Default | Required |
|----------------------------|---------------------------------------------------------------------------------------------------------|--------|---------|----------|
| `project_id`                | The GCP project ID in which the resources will be created.                                             | string | N/A     | Yes      |
| `zone`                      | The zone where the instance group will be located.                                                     | string | N/A     | Yes      |
| `network`                   | The network to which the instance group will be connected.                                             | string | N/A     | Yes      |
| `umig_name`                 | The name of the instance group.                                                                        | string | N/A     | Yes      |
| `umig_description`          | The description of the instance group.                                                                 | string | N/A     | Yes      |
| `umig_instances`            | A list of instances to be added to the instance group.                                                 | list   | N/A     | Yes      |
| `named_port`                | A list of named ports to associate with the instance group (e.g., for load balancers).                 | list   | []      | No       |

## Outputs

| Name                           | Description                                                                                             |
|--------------------------------|---------------------------------------------------------------------------------------------------------|
| `instance_group_id`           | The ID of the created instance group.                                                                    |
| `named_ports`                 | A list of named ports configured for the instance group (if any).                                        |

## Contacts and Contributing

For support or questions, please contact us via the following channels:
- Email: support@example.com
- GitHub Issues: https://github.com/example/repository/issues

We encourage contributions to this module! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your changes.
3. Ensure your changes do not break existing functionality.
4. Submit a pull request with a detailed description of the changes made.
