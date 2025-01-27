# GCP Terraform Modules  

This repository contains Terraform modules for managing Google Cloud Platform (GCP) resources. Each module is designed to handle specific GCP services and simplify infrastructure provisioning.

---

## Table of Contents

1. [Features](#features)
2. [How to Use](#how-to-use)
3. [Contacts](#contacts)
4. [Contributing](#contributing)

---

## Modules

Below are the main directories in this repository and their purpose. Click on each module to view more details.

<details>
<summary><b>gcp-tf-slz</b> (Modules for Managing Secure Landing Zone for GCP compute resources)</summary>

| **Service**           | ** Description**                                                   |
|-----------------------|---------------------------------------------------------------------------------|
| **Cloud Apis**        | The `google_project_service` resource enables specified APIs (`gcp_apis_list`) on a GCP project (`project_id`) with options to disable them on resource destruction (`disable_apis_on_destroy`) and manage dependent services (`disable_dependent_apis`). The `for_each` loop ensures that each API in the list is individually configured. |
| **Project**           | The configuration creates a Google Cloud project using the `google_project` resource. It dynamically determines the parent organization or folder based on the provided `folder_id`. The project is linked to a billing account retrieved using the `google_billing_account` data source. Custom options include project labels, tags, deletion policies, and whether to auto-create a default network. |
| **Folder**            | The google_folder resource creates a top-level folder within a GCP organization or another folder. It includes configurable properties such as the folder name, parent organization or folder, tags, and deletion protection for enhanced organization and security management. |
| **Org_Policy**        | The google_organization_policy resource enforces organization-wide constraints on Google Cloud resources. It supports boolean policies for simple enforcement, list policies to allow or deny specific values, and restore policies to revert to default settings. This ensures compliance and governance across the organization.  |
| **Folder_Policy**     | The `google_folder_organization_policy` resource applies organization-level constraints to a specific folder in Google Cloud. It supports boolean, list, and restore policies to enforce rules like access restrictions or allowed values, ensuring governance and compliance within the folder. |
| **Artifact_Registry** | The google_artifact_registry_repository resource creates and manages an Artifact Registry repository in GCP with various configurations, including Docker, Maven, virtual, cleanup, remote repositories, and upstream policies. It dynamically handles nested configurations like tags, version policies, repository formats, and cleanup rules, ensuring flexibility and automation for repository management. |
| **Billing_Budget**    | The `google_billing_budget` resource manages a GCP billing budget with dynamic configurations for specified amounts, filters, thresholds, and update rules. It supports custom periods, notification channels, and detailed budget controls. The associated `google_monitoring_notification_channel` resource sets up email notifications for budget updates. |


<a href="path/to/gcp-tf-slz">Go to Module</a>
</details>

<details>
<summary><b>gcp-tf-compute</b> (Modules for managing GCP compute resources)</summary>

| **Service**           | **Sub-Service & Description**                                                                 |
|-----------------------|-----------------------------------------------------------------------------------------------|
| **Instance Group**    | **Managed Instance Group (MIG):** Module for managing auto-scaling, load-balanced groups of VMs. <br>**Unmanaged Instance Group (UMIG):** Module for manually managed groups of VM instances. |
| **Compute Storage**   | **Custom Image:** Module for creating and managing custom VM images. <br>**Persistent Disk:** Module for managing block storage for VM instances. <br>**Snapshot:** Module for creating and managing snapshots of persistent disks for backups and disaster recovery. |
| **Virtual Machines**  | **VM Template:** Module for creating reusable VM instance templates. <br>**VM Instance:** Module for provisioning and managing individual VM instances with customizable configurations. |

<a href="path/to/gcp-tf-compute">Go to Module</a>
</details>


<details>
<summary><b>gcp-tf-analytics</b> (Modules for managing GCP analytics services)</summary>

| **Service**           | **Sub-Service & Description**                                                                 |
|-----------------------|-----------------------------------------------------------------------------------------------|
| **BigQuery**          | Scalable data warehouse for analytics and reporting.                                         |
| **Composer**          | Managed Apache Airflow service for workflow orchestration.                                   |
| **Looker**            | Enterprise platform for business intelligence and data visualization.                        |
| **Looker Studio**     | Self-service BI and data visualization tool.                                                 |
| **Pub/Sub**           | Messaging service for real-time data ingestion and event-driven systems.                     |
| **Data Pipelines**    | **Data Fusion:** Managed data integration at any scale. <br>**Databricks:** Unified analytics platform for large-scale data engineering. <br>**Dataflow:** Managed service for real-time and batch data processing. <br>**Dataplex:** Intelligent data management and governance. <br>**Dataprep:** Data preparation and cleaning service. <br>**Dataproc:** Managed Spark and Hadoop for batch and stream processing. <br>**Datastream:** Change data capture (CDC) and replication service. |

<a href="path/to/gcp-tf-analytics">Go to Module</a>
</details>

<details>
<summary><b>gcp-tf-compute</b> (Modules for managing GCP compute services)</summary>

| **Service**           | **Sub-Service & Description**                                                                 |
|-----------------------|-----------------------------------------------------------------------------------------------|
| **VM Instances**      | Provision and manage Compute Engine virtual machines.                                         |
| **Instance Groups**   | Managed and unmanaged instance groups for scaling applications.                               |
| **Custom Images**     | Create and manage custom boot images.                                                         |
| **Persistent Disks**  | Block storage for virtual machines.                                                           |
| **Snapshots**         | Backup and restore disk data using snapshots.                                                |

<a href="path/to/gcp-tf-compute">Go to Module</a>
</details>

<details>
<summary><b>gce-tf-database</b> (Modules for managing GCP database services)</summary>

| **Service**           | **Sub-Service & Description**                                                                 |
|-----------------------|-----------------------------------------------------------------------------------------------|
| **Cloud SQL**         | **MySQL:** MySQL Module shall be used to provision gcp cloudsql-mysql instance/database provided by GCP . Individual can use it to provision the with public or private ip , it also cover backup capability. <br>**PostgreSQL:** Managed PostgreSQL databases.<br>**SQL Server:** Managed SQL Server databases. |
| **Spanner**           | Horizontally scalable, strongly consistent relational database.                               |
| **Bigtable**          | Low-latency, high-throughput NoSQL database for analytical workloads.                         |
| **Firestore**         | NoSQL database designed for web and mobile applications.                                      |
| **Memorystore**       | Managed Redis and Memcached for in-memory data storage.                                       |
| **AlloyDB**           | PostgreSQL-compatible database for demanding workloads.                                       |
| **Datastore**         | Serverless NoSQL database for simple queries and scalable storage.                            |
| **Database Migration**| Simplify migrations for Cloud SQL and AlloyDB.                                                |

<a href="path/to/gce-tf-database">Go to Module</a>
</details>

<details>
<summary><b>gce-tf-storage</b> (Modules for managing GCP storage services)</summary>

| **Service**           | **Description**                                                                 |
|-----------------------|---------------------------------------------------------------------------------|
| **Cloud Storage**     | This Terraform code defines a Google Cloud Storage bucket with configurable settings. It uses variables for flexibility and dynamic blocks to manage features like lifecycle rules, versioning, encryption, and website hosting. The code also supports important configurations for access control, retention policies, and logging.                                          |
| **Filestore**         | Fully managed network-attached storage for file sharing.                        |
| **Persistent Disk**   | Block storage for Compute Engine instances.                                     |
| **Archival Storage**  | Cost-effective, durable, and secure long-term storage.                          |

<a href="path/to/gce-tf-storage">Go to Module</a>
</details>


<details>
<summary><b>gce-tf-network</b> (Modules for managing GCP networking services)</summary>

| **Service**           | **Description**                                                                 |
|-----------------------|---------------------------------------------------------------------------------|
| **VPC**               | This Terraform configuration defines a Google Cloud VPC network. It includes options for auto-creating subnetworks, custom routing modes, MTU settings,
 internal IPv6 configurations, and firewall policy enforcement. The VPC is created in the specified project, and default internet gateway routes
 can optionally be deleted upon creation.                           |
| **Cloud CDN**         | Content delivery network to accelerate content delivery.                       |
| **Cloud DNS**         | Scalable and reliable DNS service.                                             |
| **Cloud NAT**         | This Terraform configuration creates a Google Cloud NAT gateway, managing NAT IPs, subnetworks, port allocations, and protocol timeouts. It also enables
 logging and custom NAT rules with source NAT actions and filters.                          |
| **VPC Firewall**      | This Terraform configuration defines a Google Compute Firewall resource with dynamic blocks for logging, allowing, and denying traffic rules. It uses variables for network and project settings and iterates over a list of rules to apply the specified firewall configurations. | 
| **VPC Subnet**        | This Terraform configuration creates Google Cloud subnets using a map of subnet data. It dynamically configures network settings such as CIDR ranges, 
private IP access, logging configurations, and secondary IP ranges. Additionally, it supports flow logs and custom metadata fields if specified, while
 also allowing for optional descriptions, purposes, and roles for each subnet.  |
| **VPC Peering**       | This Terraform configuration creates bidirectional VPC peering between two Google Cloud networks, handling custom route and public IP subnet 
route imports/exports. A `null_resource` ensures dependency management for correct provisioning order.    |
| **Service Networking Connection** | This Terraform configuration creates a Google Cloud Service Networking connection, associating a specified network with a service and reserved peering ranges.
 It also defines a deletion policy and an option to update the connection if creation fails.  |
| **Route** | This Terraform configuration creates a custom route in Google Cloud, specifying destination ranges, network, next hop options (such as gateway, instance, or IP),
 and other routing parameters like tags, priority, and project ID. It's designed to direct traffic through specified next hop configurations, such as VPN tunnels,
 internal load balancers (ILB), or specific instances. |
| **Router** | This Terraform configuration defines a Google Cloud Router resource, including optional Border Gateway Protocol (BGP) configuration for advertising IP ranges and setting
 up BGP parameters like ASN, advertise mode, and keepalive interval. It also supports encrypted interconnect routers and specifies the region and project for deployment. |



<a href="path/to/gce-tf-network">Go to Module</a>
</details>

---

## How to Use

Follow these steps to get started with using these Terraform modules:

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/gcp-tf-modules.git



## Contributing

Contributions welcome! See the [Contributing Guide](https://github.com/GoogleCloudPlatformDevops/gcp-tf-modules/blob/main/CONTRIBUTING.md)

## Discussion

Welcome for [Discussion](https://github.com/orgs/GoogleCloudPlatformDevops/discussions) 



