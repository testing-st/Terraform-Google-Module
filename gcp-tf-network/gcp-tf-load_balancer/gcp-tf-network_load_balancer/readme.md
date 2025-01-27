# Terraform Google Cloud Load Balancer Resources

## Overview
This Terraform module provisions Google Cloud Load Balancer resources, including Target Pools, Backend Services, and Forwarding Rules. It supports both internal and external load balancing schemes and allows flexible configuration for backend services, health checks, frontend rules, and more.

The module supports the following resources:
- `google_compute_target_pool` (for managing target pools)
- `google_compute_region_backend_service` (for managing backend services)
- `google_compute_forwarding_rule` (for managing forwarding rules)

## Features
- Support for both **internal** and **external** load balancing schemes.
- Configurable backend services with dynamic backend groups.
- Ability to create and manage target pools for specific load balancing schemes.
- Flexible frontend configuration, including the ability to specify IP address, ports, and global access settings.
- Health check integration for backend services and target pools.
- Logging configuration for backend services.

## Prerequisites
- A GCP project with permissions to create compute resources.
- Pre-existing instances, health checks, or networks as required by the resources.
- For **internal** load balancing, a VPC network and subnetwork must be available.
- **External** load balancing requires public IP address allocation.

## Inputs

| Name                            | Description                                                                                       | Type   | Default | Required |
|---------------------------------|-------------------------------------------------------------------------------------------------  |--------|---------|----------|
| `project_id`                    | GCP project ID to associate with the load balancer resources.                                     | string | N/A     | Yes      |
| `region`                         | The region where the resources will be deployed.                                                 | string | N/A     | Yes      |
| `backend_type`                  | Type of backend configuration (`target_pool` or `backend_service`).                               | string | N/A     | Yes      |
| `load_balancing_scheme`         | Load balancing scheme, either `INTERNAL` or `EXTERNAL`.                                           | string | N/A     | Yes      |
| `target_pool_name`              | The name of the target pool (for `target_pool` backend type).                                     | string | N/A     | Yes      |
| `target_pool_description`       | The description for the target pool (for `target_pool` backend type).                             | string | N/A     | Yes      |
| `instances`                     | List of instances to add to the target pool (for `target_pool` backend type).                     | list   | N/A     | Yes      |
| `health_check_self_link`        | The self-link for the health check to associate with the target pool or backend service.          | string | N/A     | Yes      |
| `backend_description`           | The description for the backend service (for `backend_service` backend type).                     | string | N/A     | Yes      |
| `backend_name`                  | The name of the backend service (for `backend_service` backend type).                             | string | N/A     | Yes      |
| `backend_protocol`              | The protocol to use for the backend service (e.g., `HTTP`, `HTTPS`, `TCP`).                       | string | N/A     | Yes      |
| `backend_timeout_sec`           | The timeout for backend connections in seconds.                                                   | number | N/A     | Yes      |
| `backend`                       | List of backend configurations (e.g., instance groups and balancing mode) for the backend service.| list   | []      | Yes      |
| `log_config`                    | List of log configurations for enabling/disabling and setting sample rates for logs.              | list   | []      | No       |
| `frontend_description`          | The description for the frontend configuration.                                                   | string | N/A     | Yes      |
| `frontend_name`                 | The name of the frontend configuration.                                                           | string | N/A     | Yes      |
| `ip_protocol`                   | The IP protocol for the frontend configuration (e.g., `TCP`, `UDP`).                              | string | N/A     | Yes      |
| `all_ports`                     | Whether the frontend should use all ports (`true` or `false`).                                    | bool   | false   | Yes      |
| `ip_address`                    | The IP address to assign to the frontend.                                                         | string | N/A     | Yes      |
| `port_range`                    | Port range to forward to the backend service (only for `target_pool`).                            | string | N/A     | No       |
| `ports`                         | Specific ports to forward to the backend service (only for `backend_service`).                    | list   | []      | No       |
| `allow_global_access`           | Whether to allow global access to the load balancer.                                              | bool   | false   | No       |
| `labels`                        | A set of labels to apply to the load balancer resources.                                          | map    | {}      | No       |

## Outputs

| Name                             | Description                                                                                     |
|----------------------------------|-------------------------------------------------------------------------------------------------|
| `target_pool_id`                | The ID of the created target pool (if applicable).                                               |
| `backend_service_id`            | The ID of the created backend service (if applicable).                                           |
| `frontend_rule_id`              | The ID of the created frontend forwarding rule (if applicable).                                  |

## Contacts and Contributing

If you have any questions or need support, please contact us via the following methods:
- Email: support@example.com
- GitHub Issues: https://github.com/example/repository/issues

We welcome contributions to this module. Please follow the steps below:
1. Fork the repository.
2. Create a new branch for your changes.
3. Ensure that your changes do not break existing functionality.
4. Submit a pull request with a clear description of the changes.
