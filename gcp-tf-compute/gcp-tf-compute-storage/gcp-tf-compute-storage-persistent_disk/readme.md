# Terraform Google Compute Disk Module

## Overview
This Terraform module provisions a Google Cloud Compute Disk (`google_compute_disk`). It creates a persistent disk that can be attached to a virtual machine (VM). The module allows you to define properties such as disk size, type, image, zone, and other metadata.

## Features
- Creates a Google Cloud Compute Persistent Disk (`google_compute_disk`).
- Configurable disk size, type, and image.
- Supports custom labels and descriptions for easy identification.
- Configurable physical block size for the disk.

## Pre-requisites
- A GCP project with permissions to create and manage Compute resources.
- A valid zone where the disk will be created.
- A disk image to use as the basis for the persistent disk.

## Inputs

| Name                         | Description                                                                                             | Type   | Default       | Required |
|------------------------------|---------------------------------------------------------------------------------------------------------|--------|---------------|----------|
| `project_id`                  | The GCP project ID in which the resources will be created.                                             | string | N/A           | Yes      |
| `disk_name`                   | The name of the persistent disk.                                                                       | string | N/A           | Yes      |
| `labels`                      | A set of key/value labels to apply to the disk.                                                        | map    | {}            | No       |
| `size`                        | The size of the persistent disk in gigabytes.                                                          | number | N/A           | Yes      |
| `description`                 | A description of the persistent disk.                                                                  | string | N/A           | Yes      |
| `type`                        | The type of disk. Valid values: `pd-standard`, `pd-ssd`, `pd-balanced`.                                | string | `pd-standard` | No       |
| `zone`                        | The zone where the disk will be created.                                                               | string | N/A           | Yes      |
| `image`                       | The image to be used to create the persistent disk.                                                    | string | N/A           | Yes      |
| `physical_block_size_bytes`   | The physical block size in bytes. This field is only applicable to certain disk types.                 | number | 4096          | No       |

## Outputs

| Name                           | Description                                                                                             |
|--------------------------------|---------------------------------------------------------------------------------------------------------|
| `disk_id`                      | The ID of the created persistent disk.                                                                  |
| `disk_self_link`               | The self-link URL of the persistent disk.                                                               |

## Contacts and Contributing

For support or questions, please contact us via the following channels:
- Email: support@example.com
- GitHub Issues: https://github.com/example/repository/issues

We encourage contributions to this module! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your changes.
3. Ensure your changes do not break existing functionality.
4. Submit a pull request with a detailed description of the changes made.
