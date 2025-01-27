# Terraform Google Compute Backend Service Modules

## Overview

This Terraform module provisions a **Google Compute Backend Service** or **Google Compute Region Backend Service**. These services are responsible for managing the backend configuration of load balancing setups in Google Cloud. Backend services route traffic to virtual machine instances or instance groups based on load balancing schemes, health checks, and other configurations. 

The two resources—`google_compute_backend_service` (for global backends) and `google_compute_region_backend_service` (for regional backends)—enable flexible, scalable backend setups for various load balancing schemes such as HTTP(S), TCP, and SSL.

## Features

- **google_compute_backend_service**:
  - Supports global load balancing for HTTP(S), TCP, and SSL traffic.
  - Can be associated with instance groups and managed instance groups.
  - Allows detailed configuration of health checks, timeout settings, and logging.
  
- **google_compute_region_backend_service**:
  - Used for regional load balancing configurations.
  - Supports integration with regional instance groups and backend configurations.
  - Similar features as the global backend service but designed for regional traffic handling.
  
- Health check integration to ensure backend instances are healthy and responsive.
- Customizable backend and log configurations.
- Supports logging configurations and balancing modes (e.g., RATE, UTILIZATION, etc.).

## Pre-requisites

- A Google Cloud Project where the resources will be created.
- Pre-configured instance groups or managed instance groups (for backend services).
- Health check resources configured for backend health monitoring.
- Understanding of Google Cloud's load balancing architecture and backend service setup.

## Inputs

### Common Inputs for Both `google_compute_backend_service` and `google_compute_region_backend_service`

| Name                      | Description                                                                                 | Type   | Default    | Required |
|---------------------------|---------------------------------------------------------------------------------------------|--------|------------|----------|
| `project_id`               | The GCP project ID in which the resources will be created.                                 | string | N/A        | Yes      |
| `name`                     | The name of the backend service.                                                           | string | N/A        | Yes      |
| `description`              | A description of the backend service.                                                      | string | N/A        | No       |
| `load_balancing_scheme`    | The load balancing scheme used, can be "INTERNAL" or "EXTERNAL".                           | string | "EXTERNAL" | No       |
| `protocol`                 | The protocol to be used (HTTP, HTTPS, SSL, TCP).                                           | string | N/A        | Yes      |
| `health_checks`            | A list of health check resources used for backend health monitoring.                       | list   | N/A        | Yes      |
| `timeout_sec`              | The timeout in seconds for backend responses.                                              | number | N/A        | Yes      |
| `log_config`               | Optional configuration for logging backends' traffic.                                      | object | N/A        | No       |
| `backend`                  | A list of backend configurations, including instance group, balancing mode, and capacity.  | list   | N/A        | Yes      |

### Additional Inputs for `google_compute_region_backend_service`

| Name                      | Description                                                                                 | Type   | Default | Required |
|---------------------------|---------------------------------------------------------------------------------------------|--------|---------|----------|
| `region`                   | The region where the backend service will be created.                                      | string | N/A     | Yes      |
| `network`                  | The network associated with the backend service (for internal load balancing).             | string | N/A     | Yes      |

### Additional Inputs for `google_compute_backend_service`

| Name                      | Description                                                                                 | Type   | Default | Required |
|---------------------------|---------------------------------------------------------------------------------------------|--------|---------|----------|
| `global`                   | Flag to indicate if the backend service should be global.                                  | bool   | true    | Yes      |

## Outputs

| Name                     | Description                                                                |
|--------------------------|----------------------------------------------------------------------------|
| `backend_service_id`      | The ID of the created backend service.                                    |
| `self_link`               | The self-link of the created backend service.                             |
| `url_map`                 | The URL map if applicable for routing configuration in global backend.    |

## Contacts and Contributing

For support or questions, please contact us via the following channels:
- Email: support@example.com
- GitHub Issues: https://github.com/example/repository/issues

We encourage contributions to this module! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your changes.
3. Ensure your changes do not break existing functionality.
4. Submit a pull request with a detailed description of the changes made.


## Maintainers:
[Your Name] - [your.email@example.com]
License
This module is released under the MIT License.