# Terraform Module: GCP Cloud Storage Bucket
 
## Overview
 
This Terraform module provisions a Google Cloud Storage bucket on Google Cloud Platform (GCP). It supports a wide range of configurations, including bucket versioning, lifecycle rules, and access controls.
 
## Features
 
 - **General Configuration**: Create buckets with customizable `name`, `location`, `project`, and `storage_class`.
 - **Access Control**: Manage access with `uniform_bucket_level_access` and `public_access_prevention`.
 - **Lifecycle Rules**: Automate object management with configurable actions and conditions.
 - **Protection**: Enable object `versioning` and retention policies .Use `default_event_based_hold`.Configure encryption with CMEK.
 - **Monitoring**: Enable logging with `log_bucket` and `log_object_prefix`.Add metadata using `labels`.
 - **Advanced Features**: `website` hosting,`cors` for cross-origin resource sharing, `soft_delete_policy` for temporary deletion.
 

## Prerequisites
 
1. **Google Cloud Project**: Ensure you have an active GCP project.
2. **IAM Permissions**: The user/service account running Terraform must have the following roles:
   - `roles/storage.admin` or equivalent permissions to manage Cloud Storage buckets.
   - `roles/iam.serviceAccountUser` for managing access controls.
3. **Enable APIs**: 'storage.googleapis.com'



 
## Inputs
 
| Name               | Description                                                  | Type     | Default | Required |
|--------------------|--------------------------------------------------------------|----------|---------|----------|
| `bucket_name`      | The name of the Cloud Storage bucket                         | `string` | -       | Yes      |
| `location`         | The GCP location for the bucket                              | `string` | `US`    | No       |
| `storage_class`    | The storage class (e.g., `STANDARD`, `NEARLINE`, etc.)       | `string` | `STANDARD` | No    |
| `enable_versioning`| Enable versioning for the bucket                             | `bool`   | `false` | No       |
| `enable_logging`   | Enable logging for the bucket                                | `bool`   | `false` | No       |
| `labels`           | Key-value pairs for bucket labels                           | `map`    | `{}`    | No       |
| `lifecycle_rules`  | Lifecycle management rules for the bucket                   | `list`   | `[]`    | No       |
 
## Outputs
 
| Name               | Description                                                  |
|--------------------|--------------------------------------------------------------|
| `bucket_name`      | The name of the provisioned Cloud Storage bucket             |
| `bucket_url`       | The URL of the bucket (e.g., `gs://bucket_name/`)            |
| `bucket_self_link` | The resource's self-link in GCP                              |
 

 


## Contacts and  Contributing
 
For questions, issues, or suggestions, feel free to reach out:
 
- **Maintainer**: MARCOS  
- **Email**: gcpscaledelivery.com  
- **Slack**: #terraform-modules  
 
