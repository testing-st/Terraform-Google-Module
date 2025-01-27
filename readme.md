# GCP Terraform Modules

This repository contains Terraform modules for managing Google Cloud Platform (GCP) resources. Each module is designed to handle specific GCP services and simplify infrastructure provisioning.

---

## Table of Contents

1. [Features](#features)
2. [How to Use](#how-to-use)
3. [Contacts](#contacts)
4. [Contributing](#contributing)

---

## Features

Below are the main directories in this repository and their purpose. Click on each module to view more details.

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
| **VPC**               | Virtual Private Cloud to connect resources securely.                           |
| **Cloud CDN**         | Content delivery network to accelerate content delivery.                       |
| **Cloud DNS**         | Scalable and reliable DNS service.                                             |
| **Cloud NAT**         | Network Address Translation for private VM instances.                          |
| **VPC Firewall**      | This Terraform configuration defines a Google Compute Firewall resource with dynamic blocks for logging, allowing, and denying traffic rules. It uses variables for network and project settings and iterates over a list of rules to apply the specified firewall configurations. | 

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



