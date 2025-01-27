# Terraform Google Cloud Proxy Resources

## Overview
This Terraform module provisions HTTP(S) Proxy resources for Google Cloud. It supports the creation of region-specific and global HTTP/HTTPS proxies with custom configurations like SSL certificates, keep-alive timeouts, and more.

The module provides the following resource blocks:
- `google_compute_region_target_http_proxy`
- `google_compute_region_target_https_proxy`
- `google_compute_target_http_proxy`
- `google_compute_target_https_proxy`

It enables users to define global or regional HTTP(S) proxy configurations in Google Cloud Platform (GCP) depending on their requirements.

## Features
- Supports both HTTP and HTTPS proxies for global and regional scopes.
- Configures SSL certificates from Google Cloud's Certificate Manager or custom SSL certificates.
- Allows setting of HTTP keep-alive timeout, TLS policies, and proxy binding.
- Optionally integrates with custom URL maps and certificates for advanced configurations.

## Prerequisites
- A GCP project with permissions to create compute resources.
- A pre-existing URL map ID (for `url_map` parameter).
- Certificate Manager certificates or custom SSL certificates (if using HTTPS).
- An SSL policy for HTTPS configurations.
- Optionally, a server TLS policy.

## Inputs

| Name                                 | Description                                                                                    | Type   | Default | Required |
|--------------------------------------|----------------------------------------------------------------------------------------------- |--------|---------|----------|
| `scope`                              | Scope of the proxy resource, can be `global` or `regional`.                                    | string | N/A     | Yes      |
| `project_id`                         | GCP project ID for the resources.                                                              | string | N/A     | Yes      |
| `region`                             | The region for the regional proxy.                                                             | string | N/A     | Yes      |
| `target_proxy_type`                  | Type of proxy, can be `http` or `https`.                                                       | string | N/A     | Yes      |
| `proxy_name`                         | The name of the proxy resource.                                                                | string | N/A     | Yes      |
| `proxy_description`                  | The description for the proxy resource.                                                        | string | N/A     | Yes      |
| `proxy_bind`                         | Whether the proxy should bind to a specific IP address.                                        | bool   | false   | No       |
| `http_keep_alive_timeout_sec`        | The HTTP keep-alive timeout in seconds.                                                        | number | 100     | No       |
| `certificate_manager_certificates`    | List of certificate manager certificates (for HTTPS).                                         | list   | []      | No       |
| `ssl_certificates_id`                | List of custom SSL certificates (for HTTPS).                                                   | list   | []      | No       |
| `ssl_policy`                         | SSL policy configuration for HTTPS proxies.                                                    | string | N/A     | Yes      |
| `quic_override`                      | QUIC protocol override for HTTPS.                                                              | string | N/A     | No       |
| `tls_early_data`                     | Whether to enable TLS early data for HTTPS.                                                    | bool   | false   | No       |
| `certificate_map`                    | Certificate map for the proxy (for advanced use cases).                                        | string | N/A     | No       |
| `server_tls_policy`                  | Server TLS policy for secure communication.                                                    | string | N/A     | No       |
| `url_map_id`                         | The URL map ID to associate with the proxy.                                                    | string | N/A     | Yes      |
| `proxy_project_id`                   | GCP project ID to use for the proxy, defaults to the value of `project_id` if not specified.   | string | N/A     | No       |

## Outputs

| Name                                 | Description                                                                                   |
|--------------------------------------|-----------------------------------------------------------------------------------------------|
| `region_target_http_proxy`           | The created regional HTTP proxy resource (if applicable).                                     |
| `region_target_https_proxy`          | The created regional HTTPS proxy resource (if applicable).                                    |
| `global_target_http_proxy`           | The created global HTTP proxy resource (if applicable).                                       |
| `global_target_https_proxy`          | The created global HTTPS proxy resource (if applicable).                                      |

## Contract and Contributing
If you have any questions or need assistance, feel free to reach out to the maintainers. We welcome contributions to this project! Here's how you can contribute:

Fork the repository.
Create a new branch for your changes.
Make your changes.
Submit a pull request with a description of your changes.
For any issues or inquiries, please open an issue in the GitHub repository.

## Maintainers:
[Your Name] - [your.email@example.com]
License
This module is released under the MIT License.
