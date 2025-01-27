# Terraform Google Cloud Health Check Resources

## Overview
This Terraform module provisions Health Check resources for Google Cloud, including both global and regional health checks. It supports various types of health checks, such as HTTP, HTTPS, TCP, SSL, HTTP2, and gRPC. The module allows for customizable configurations for health checks with flexible log configurations, thresholds, and timeout settings.

The module provides the following resource blocks:
- `google_compute_health_check` (Global Health Check)
- `google_compute_region_health_check` (Regional Health Check)

## Features
- Supports global and regional health checks.
- Configurable health checks for HTTP, HTTPS, TCP, SSL, HTTP2, and gRPC.
- Flexible configuration options for health check parameters like interval, timeout, thresholds, and source regions.
- Log configuration support to enable or disable logging.
- Allows multiple health check types to be configured simultaneously using dynamic blocks.

## Prerequisites
- A GCP project with permissions to create compute resources.
- Pre-existing health check types configured (HTTP, HTTPS, TCP, SSL, HTTP2, or gRPC).
- Required region or global parameters for creating health checks.

## Inputs

| Name                             | Description                                                                                    | Type   | Default | Required |
|----------------------------------|----------------------------------------------------------------------------------------------- |--------|---------|----------|
| `health_check_type`              | Type of health check, can be `global` or `region`.                                             | string | N/A     | Yes      |
| `project_id`                     | GCP project ID to associate the health check resources.                                        | string | N/A     | Yes      |
| `health_check_name`              | The name of the health check resource.                                                         | string | N/A     | Yes      |
| `health_check_description`       | The description for the health check resource.                                                 | string | N/A     | Yes      |
| `check_interval_sec`             | The interval between health check requests in seconds.                                         | number | N/A     | Yes      |
| `timeout_sec`                    | The timeout for each health check in seconds.                                                  | number | N/A     | Yes      |
| `healthy_threshold`              | The number of consecutive successful checks before the resource is considered healthy.         | number | N/A     | Yes      |
| `unhealthy_threshold`            | The number of consecutive failed checks before the resource is considered unhealthy.           | number | N/A     | Yes      |
| `http_health_check`              | List of HTTP health check configurations.                                                      | list   | []      | No       |
| `https_health_check`             | List of HTTPS health check configurations.                                                     | list   | []      | No       |
| `tcp_health_check`               | List of TCP health check configurations.                                                       | list   | []      | No       |
| `ssl_health_check`               | List of SSL health check configurations.                                                       | list   | []      | No       |
| `http2_health_check`             | List of HTTP2 health check configurations.                                                     | list   | []      | No       |
| `grpc_health_check`              | List of gRPC health check configurations.                                                      | list   | []      | No       |
| `log_config`                     | List of log configurations to enable or disable logging.                                       | list   | []      | No       |
| `source_regions`                 | List of regions from which to source the health check.                                         | list   | []      | No       |
| `region`                         | The region for the regional health check.                                                      | string | N/A     | Yes      |

## Outputs

| Name                            | Description                                                                                   |
|---------------------------------|-----------------------------------------------------------------------------------------------|
| `global_health_check`           | The created global health check resource (if applicable).                                      |
| `region_health_check`           | The created regional health check resource (if applicable).                                    |

## Contacts and Contributing

If you have any questions or need support, please contact us via the following methods:
- Email: support@example.com
- GitHub Issues: https://github.com/example/repository/issues

We welcome contributions to this module. Please follow the steps below:
1. Fork the repository.
2. Create a new branch for your changes.
3. Ensure that your changes do not break existing functionality.
4. Submit a pull request with a clear description of the changes.

## Maintainers:
[Your Name] - [your.email@example.com]
License
This module is released under the MIT License.