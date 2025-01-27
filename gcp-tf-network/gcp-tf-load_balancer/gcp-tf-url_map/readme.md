# Terraform Google Compute URL Map Modules

## Overview

The `google_compute_url_map` and `google_compute_region_url_map` Terraform modules allow you to define URL map resources for HTTP(S) load balancing in Google Cloud. A URL map is used to route HTTP(S) requests to the appropriate backend based on the URL of the request. These resources allow for advanced routing, including path-based routing, host-based routing, and routing based on query parameters.

- **google_compute_url_map**: This resource is used for global HTTP(S) load balancing and can route traffic to backend services, backend buckets, or URL maps. It operates on a global scale, typically used with a global load balancer.
  
- **google_compute_region_url_map**: This resource is used for regional HTTP(S) load balancing, operating on a specific Google Cloud region.

Both resources support advanced routing features such as default route handling, redirect rules, and various path matchers.

## Features

- **Path-based Routing**: Route traffic to different backends based on the URL path.
- **Host-based Routing**: Route traffic to different backends based on the request's Host header.
- **Redirect Rules**: Configure automatic redirection of requests.
- **URL Map Advanced Matching**: Use advanced matching criteria such as headers, query parameters, and more.
- **Global and Regional Support**: `google_compute_url_map` is used for global routing, while `google_compute_region_url_map` allows for regional routing based on the load balancing scheme.
- **Backends and Path Matcher Integration**: Supports backend services, backend buckets, and path matchers for traffic management.

## Pre-requisites

Before using this module, ensure you have:

- A Google Cloud Project with the necessary IAM permissions to create load balancing and networking resources.
- Pre-existing **backend services** (e.g., `google_compute_backend_service` or `google_compute_region_backend_service`) for routing.
- Pre-configured **URL map resources** for routing HTTP(S) requests.
- **Health checks** configured for backend services, if required.
- Understanding of how Google Cloud's HTTP(S) Load Balancer and URL Map works.

## Inputs

### Common Inputs for Both `google_compute_url_map` and `google_compute_region_url_map`

| Name                      | Description                                                                                 | Type   | Default | Required |
|---------------------------|---------------------------------------------------------------------------------------------|--------|---------|----------|
| `project_id`               | The GCP project ID in which the resources will be created.                                 | string | N/A     | Yes      |
| `name`                     | The name of the URL map.                                                                   | string | N/A     | Yes      |
| `description`              | A description of the URL map resource.                                                     | string | ""      | No       |
| `default_url_redirect`     | URL redirect configuration for the default route.                                          | object | N/A     | No       |
| `default_service`          | The default backend service to route traffic when no matching rule is found.               | string | N/A     | Yes      |
| `default_route_action`     | A default route action (e.g., `route`, `redirect`) for unmatched requests.                 | string | "route" | No       |
| `host_rules`               | A list of host rules to configure routing based on domain names.                           | list   | N/A     | Yes      |
| `path_matchers`            | A list of path matchers used for routing traffic based on request paths.                   | list   | N/A     | Yes      |
| `project`                  | The GCP project ID.                                                                        | string | N/A     | Yes      |

### Additional Inputs for `google_compute_region_url_map`

| Name                      | Description                                                                                 | Type   | Default | Required |
|---------------------------|---------------------------------------------------------------------------------------------|--------|---------|----------|
| `region`                   | The region in which the URL map will be created.                                           | string | N/A    | Yes      |

### Additional Inputs for `google_compute_url_map`

| Name                      | Description                                                                                 | Type   | Default | Required |
|---------------------------|---------------------------------------------------------------------------------------------|--------|---------|----------|
| `global`                   | Flag to specify whether the URL map is for global routing.                                 | bool   | true    | Yes      |

## Outputs

| Name                     | Description                                                                |
|--------------------------|----------------------------------------------------------------------------|
| `url_map_id`              | The unique identifier of the created URL map.                             |
| `self_link`               | The self-link URL of the created URL map.                                 |
| `default_backend`         | The backend service URL for the default route.                            |
| `host_rule_links`         | A list of host rule links associated with the URL map.                    |
| `path_matcher_links`      | A list of path matcher links associated with the URL map.                 |
## Contacts and Contributing

For support or questions, please contact us via the following channels:
- Email: support@example.com
- GitHub Issues: https://github.com/example/repository/issues

We encourage contributions to this module! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your changes.
3. Ensure your changes do not break existing functionality.
4. Submit a pull request with a detailed description of the changes made.
