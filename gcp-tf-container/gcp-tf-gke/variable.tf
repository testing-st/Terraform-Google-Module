variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in (required)"
}
 
variable "name" {
  type        = string
  description = "The name of the cluster (required)"
}
 
variable "description" {
  type        = string
  description = "The description of the cluster"
  default     = ""
}

variable "location" {
  type        = string
  description = "The location (region or zone) in which the cluster master will be created, as well as the default node location."
  default     = ""
}


variable "node_locations" {
  type = list(string)
 description = "The list of zones in which the cluster's nodes are located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters."
}

variable "addons_config"{
    type = list(object({
      http_load_balancing = list(object({
        disabled = bool
      }))
      horizontal_pod_autoscaling = list(object({
          disabled = bool
      }))
      network_policy_config = list(object({
        disabled = bool
      }))
      dns_cache_config = list(object({
        enabled = bool
         }))
      gcp_filestore_csi_driver_config = list(object({
         enabled = bool
      }))
      config_connector_config = list(object({
         enabled = bool
      }))
      gke_backup_agent_config = list(object({
         enabled = bool
      }))
      gcs_fuse_csi_driver_config = list(object({
         enabled = bool
      }))
      cloudrun_config = list(object({
         disabled = bool
         load_balancer_type = string
      }))
      gce_persistent_disk_csi_driver_config =  list(object({
         enabled = bool
      }))
      stateful_ha_config = list(object({
        enabled = bool
      }))
      /*
        kalm_config = list(object({
          enabled = bool
      })) */
      /*   istio_config = list(object({
          disabled = bool
          auth = string
         })) */
         ray_operator_config = list(object({
          enabled = bool 
          ray_cluster_logging_config = list(object({
            enabled = bool
          }))
            ray_cluster_monitoring_config = list(object({
              enabled = bool
            }))
         }))
    }))
}
 
variable "network" {
  type        = string
  description = "The VPC network to host the cluster in (required)"
}
 
variable "subnetwork" {
  type        = string
  description = "The subnetwork to host the cluster in (required)"
}

 variable "allow_net_admin" {
  type        = bool
  description = "Enable NET_ADMIN for the cluster. ."
  default     = false
}

variable "cluster_ipv4_cidr" {
  type = string
  description = "The IP address range of the Kubernetes pods in this cluster in CIDR notation (e.g. 10.96.0.0/14)"
}

variable "datapath_provider" {
  type        = string
  description = "The desired datapath provider for this cluster. By default, `DATAPATH_PROVIDER_UNSPECIFIED` enables the IPTables-based kube-proxy implementation. `ADVANCED_DATAPATH` enables Dataplane-V2 feature."
  default     = "DATAPATH_PROVIDER_UNSPECIFIED"
}

variable "enable_kubernetes_alpha" {
  type = bool
  description = "Whether to enable Kubernetes Alpha features for this cluster. Note that when this option is enabled, the cluster cannot be upgraded and will be automatically deleted after 30 days."
}

variable "enable_tpu" {
  type        = bool
  description = "Enable Cloud TPU resources in the cluster. WARNING: changing this after cluster creation is destructive!"
  default     = false
}
 

variable "enable_legacy_abac" {
  type = bool
  description = "Whether the ABAC authorizer is enabled for this cluster. When enabled, identities in the system, including service accounts, nodes, and controllers, will have statically granted permissions beyond those provided by the RBAC configuration or IAM."
}

variable "networking_mode" {
  type = string
  description = "Determines whether alias IPs or routes will be used for pod IPs in the cluster."
}

#variable "node_version" {}

variable "resource_labels" {}

#variable  "enable_fqdn_network_policy" {}


variable "remove_default_node_pool" {
  type        = bool
  description = "Remove default node pool while setting up the cluster"
  default     = false
}

variable "enable_intranode_visibility" {
  type        = bool
  description = "Whether Intra-node visibility is enabled for this cluster. This makes same node pod to pod traffic visible for VPC network"
  default     = false
}
 
variable "enable_l4_ilb_subsetting" {
  type        = bool
  description = "Enable L4 ILB Subsetting on the cluster"
  default     = false
}

variable  "enable_multi_networking" {}

variable "identity_service_config" {
  type = list(object({
    enabled = bool
  }))
}

variable  "private_ipv6_google_access" {

}
variable "enable_cilium_clusterwide_network_policy" {
  type        = bool
  description = "Enable Cilium Cluster Wide Network Policies on the cluster"
  default     = false
}


variable "enable_k8s_beta_apis" {
  type        = list(object({
  enabled_apis = list(string)
  }))
  description = "Enabled Kubernetes Beta APIs. To list a Beta API resource, use the representation {group}/{version}/{resource}"
}

variable "release_channel" {
 # type        = string
  description = "The release channel of this cluster. Accepted values are `UNSPECIFIED`, `RAPID`, `REGULAR` and `STABLE`. Defaults to `REGULAR`."
  default     = "REGULAR"

}

variable "gateway_api_config" {}

variable "cost_management_config" {
 type = list(object({
  enabled =  bool
 }))
}

variable "default_snat_status" {
  type = list(object({
    disabled = bool
  }))
}

variable "cluster_autoscaling" {
 type = list(object({
 enabled = bool
 resource_limits =list(object({
      resource_type = string
      minimum = number
      maximum = number
 }))
  auto_provisioning_defaults = list (object({
    service_account	= string
    oauth_scopes   	= list(string)
    boot_disk_kms_key = string
    min_cpu_platform	= string
    management =  list (object({
       auto_repair = bool
			 auto_upgrade = bool
      upgrade_settings = list(object({
        strategy = string
        max_surge = number
        max_unavailable = number
      blue_green_settings = list(object({
        node_pool_soak_duration = string
        standard_rollout_policy = list(object({
          batch_soak_duration = number
          batch_percentage = string
          batch_node_count = number
      }))
  }))
  }))
    }))
    image_type = string
    disk_size = number
    disk_type = string
    shielded_instance_config = list(object({
        enable_secure_boot =  bool
        enable_integrity_monitoring = bool
      }))
  }))
    autoscaling_profile = string
    auto_provisioning_locations = string
 }))
}

#variable "min_master_version" {}

variable "ip_allocation_policy" {
type = list(object({
   cluster_secondary_range_name = string
   services_secondary_range_name = string
   services_ipv4_cidr_block = string
    cluster_ipv4_cidr_block = string
    stack_type = string
    additional_pod_ranges_config = list(object({
      pod_range_names = list(string)
    }))
}))
}

variable "master_auth" {
  type = list(object({
    client_certificate_config = list(object({
      issue_client_certificate = bool
  }))
  }))
}


variable "master_authorized_networks_config" {
  type = list(object({
    cidr_blocks = list(object({
      cidr_block = string
      display_name = string
      private_endpoint_enforcement_enabled = bool
  }))
  gcp_public_cidrs_access_enabled         = bool
  }))
}


variable "logging_service" {
  type        = string
  description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com, logging.googleapis.com/kubernetes (beta), and none"
  default     = "logging.googleapis.com/kubernetes"
}

variable "logging_config" {
  type        = list(object({
  enable_components = list(string)
  }))
}

variable "monitoring_config" {
  type        = list(object({
  enable_components = list(string)
  managed_prometheus = list(object({
    enabled = bool
  }))
  advanced_datapath_observability_config = list(object({
    enable_metrics = bool
    enable_relay = bool
  }))
  }))
}


variable "monitoring_service" {
  type        = string
  description = "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Google Cloud Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting Available options include monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none"
  default     = "monitoring.googleapis.com/kubernetes"
}


variable "security_posture_config" {
  type = list(object({
    mode = string
    vulnerability_mode = string
  }))
}

variable "vertical_pod_autoscaling" {
 type = list(object({
  enabled =  bool
 }))
}

variable "enable_shielded_nodes" {
type        = bool
description = "Enable Shielded Nodes features on all nodes in this cluster"
default     = true
}

/*
variable "enable_autopilot" {
  type        = bool
  description = "Enable Autopilot for this cluster. Defaults to false. Note that when this option is enabled, certain features of Standard GKE are not available"
  default     = false
}

*/
variable "default_max_pods_per_node" {
  type        = number
  description = "The maximum number of pods to schedule per node"
  default     = 110
}

variable "initial_node_count" {
  type        = number
  description = "The number of nodes to create in this cluster's default node pool."
  default     = 0
}

variable "fleet" {
  type = list(object({
    project = string
  }))
}


variable "binary_authorization" {
  type = list(object({
    enabled = bool
    evaluation_mode = string
  }))
  description = "Configuration options for the Binary Authorization feature."
}
variable "service_external_ips_config" {
  type = list(object({
    enabled  = bool
  }))
  description = "Controls whether external ips specified by a service will be allowed. It is enabled by default." 
}

variable "mesh_certificates" {
    type = list(object({
        enable_certificates = bool
    }))
    description = "Controls the issuance of workload mTLS certificates. It is enabled by default. Workload Identity is required, see workload_config."
}
variable "database_encryption" {
  type = list(object({
    state = string
    key_name = string 
  }))
}


variable "dns_config" {
  type = list(object({
   # additive_vpc_scope_dns_domain = string
    cluster_dns = string
    cluster_dns_scope = string
    cluster_dns_domain = string
  }))
}

variable "network_policy" {

type = list(object({
  provider = string
  enabled = bool

}))
}


variable "node_config" {
 type = list(object({
  disk_size_gb  = number                  
  disk_type      = string                     
  enable_confidential_storage  = bool
  /*ephemeral_storage_config = list(object({
    local_ssd_count = number
  }))*/
  ephemeral_storage_local_ssd_config = list(object({
    local_ssd_count = number
  }))
  fast_socket = list(object({
      enabled = bool
  }))
  local_nvme_ssd_block_config = list(object ({
      local_ssd_count = number
  }))
  logging_variant = string
  secondary_boot_disks = list(object({
   disk_image = string
   mode = string
  }))
  gcfs_config  = list(object({
    enabled = bool
  }))  
  gvnic  = list(object({
    enabled = bool
  }))
  guest_accelerator = list(object({
      type = string
      count = number
      gpu_driver_installation_config = list(object({
            gpu_driver_version = string
      }))
      gpu_partition_size = number
      gpu_sharing_config = list(object({
        gpu_sharing_strategy = string
        max_shared_clients_per_gpu = number
      }))
  }))
  image_type                              = string
  labels                                  = map(string)
  resource_labels                         = map(string)
  local_ssd_count                         = number
  machine_type                            = string
  metadata                                = map(string)
  min_cpu_platform                        = number
  oauth_scopes                            = list(string)
  preemptible                             = bool
  reservation_affinity                    = list(object({
      consume_reservation_type            = string
      key                                 =  string
      values                              = list(string)
  }))
  spot                                    = string
 /* sandbox_config  = list(object({
    sandbox_type = string
  })) */
  boot_disk_kms_key                       = string
  service_account                         =  string
  shielded_instance_config = list(object({
    enable_secure_boot                  = bool
    enable_integrity_monitoring  = bool
  }))
  tags                                    = list(string)
  resource_manager_tags                   = map(string)
  taint  = list(object({
    key = string
    value = string
    effect = string
  }))
  workload_metadata_config =  list(object({
    mode     =  string
  }))
  kubelet_config = list(object({
    cpu_manager_policy                  = string
    cpu_cfs_quota                       = bool
    cpu_cfs_quota_period                = string
    pod_pids_limit                      = number
  }))
node_group                              = string
sole_tenant_config = list(object({
  node_affinity =  list(object({
    key = string
    operator = string
    values = list(string)
  }))
}))
  advanced_machine_features = list(object({
    threads_per_core                    = number
    enable_nested_virtualization        = bool
  }))
  linux_node_config = list(object({
      sysctls = map(string)
      cgroup_mode = string
  }))                          
 }))
}


variable "node_pool" {
  type        = list(object({
    name       = string
    initial_node_count = number
  }))
}

variable "notification_config" {
type = list(object({
  pubsub = list(object({
    enabled = bool
    topic = string
    filter = list(object({
      event_type = list(string)
    }))
  }))
}))
}


variable "node_pool_auto_config" {
 type = list(object({
 resource_manager_tags = map(any)
 network_tags = list(object({
  tags  = list(string)
 }))
 node_kubelet_config = list(object({
 insecure_kubelet_readonly_port_enabled = string
 }))  
 }))
}


variable "node_pool_defaults" {
type = list(object({
node_config_defaults = list(object({
 # insecure_kubelet_readonly_port_enabled = string
  logging_variant = string
  gcfs_config = list(object({
    enabled = bool
  }))
}))
}))
}

variable "confidential_nodes" {
  type = list(object({
    enabled = bool
  }))
}

/*
variable "pod_security_policy_config" {
 type = list(object({
 enabled = bool
 }))
}*/

variable "authenticator_groups_config" {
 type = list(object({
 security_group = bool
 }))
}

variable "private_cluster_config" {
 type = list(object({
 enable_private_nodes        = bool
 enable_private_endpoint     = bool
 #master_ipv4_cidr_block      =  string
 private_endpoint_subnetwork =  string
 master_global_access_config = list(object({
  enabled = bool
 }))
 }))
}

/*
variable "cluster_telemetry" {
 type = list(object({
  type =  string
 }))
}

*/

variable "resource_usage_export_config" {
  type = list(object({
    enable_network_egress_metering = bool
    enable_resource_consumption_metering = bool
    bigquery_destination = list(object({
      dataset_id = string
    }))

  }))
  description = "Configuration for the ResourceUsageExportConfig feature."
}

variable "workload_identity_config" {
 type = list(object({
  workload_pool =  string
 }))
}

/*
variable "protect_config" {
  type = list(object({
    workload_config = list(object({
      audit_mode = string
    }))
    workload_vulnerability_mode = string
  }))
}
*/


####################
variable "cloudrun_config_enabled" {
  type        = bool
  description = "Allow access through Google Cloud public IP addresses"
  default     = null
}
variable "enable_vertical_pod_autoscaling" {
  type        = bool
  description = "Vertical Pod Autoscaling automatically adjusts the resources of pods controlled by it"
  default     = false
}
 
 variable "load_balancer_type" {
  type        = string
  description = "The load balancer type of CloudRun ingress service."
  default     = ""
}


variable "service_external_ips" {
  type        = bool
  description = "Whether external ips specified by a service will be allowed in this cluster"
  default     = false
}
 
variable "maintenance_policy" {
  type = list(object({
  recurring_window = list(object({
    start_time = string
    end_time   = string
    recurrence = string
  }))
  daily_maintenance_window = list(object({
    start_time = string
  }))
  maintenance_exclusion = list(object({
     exclusion_name = string
     start_time     = string
     end_time       = string
     exclusion_options = list(object({
      scope = string
     }))
  }))
  }))
}

variable "additional_ip_range_pods" {
  type        = list(string)
  description = "List of _names_ of the additional secondary subnet ip ranges to use for pods"
  default     = []
}
 
variable "node_pools" {
  type        = list(map(any))
  description = "List of maps containing node pools"
 
  default = [
    {
      name = "default-node-pool"
    },
  ]
}
 
variable "windows_node_pools" {
  type        = list(map(string))
  description = "List of maps containing Windows node pools"
  default     = []
}
 
variable "node_pools_labels" {
  type        = map(map(string))
  description = "Map of maps containing node labels by node-pool name"
 
  # Default is being set in variables_defaults.tf
  default = {
    all               = {}
    default-node-pool = {}
  }
}
 
variable "node_pools_resource_labels" {
  type        = map(map(string))
  description = "Map of maps containing resource labels by node-pool name"
 
  default = {
    all               = {}
    default-node-pool = {}
  }
}
 
variable "node_pools_resource_manager_tags" {
  type        = map(map(string))
  description = "Map of maps containing resource manager tags by node-pool name"
  default = {
    all               = {}
    default-node-pool = {}
  }
}
 
variable "node_pools_metadata" {
  type        = map(map(string))
  description = "Map of maps containing node metadata by node-pool name"
 
  # Default is being set in variables_defaults.tf
  default = {
    all               = {}
    default-node-pool = {}
  }
}
 
variable "node_pools_linux_node_configs_sysctls" {
  type        = map(map(string))
  description = "Map of maps containing linux node config sysctls by node-pool name"
 
  # Default is being set in variables_defaults.tf
  default = {
    all               = {}
    default-node-pool = {}
  }
}
variable "node_pools_cgroup_mode" {
  type        = map(string)
  description = "Map of strings containing cgroup node config by node-pool name"
 
  # Default is being set in variables_defaults.tf
  default = {
    all               = ""
    default-node-pool = ""
  }
}
 
variable "enable_cost_allocation" {
  type        = bool
  description = "Enables Cost Allocation Feature and the cluster name and namespace of your GKE workloads appear in the labels field of the billing export to BigQuery"
  default     = false
}
variable "resource_usage_export_dataset_id" {
  type        = string
  description = "The ID of a BigQuery Dataset for using BigQuery as the destination of resource usage export."
  default     = ""
}
 
variable "enable_network_egress_export" {
  type        = bool
  description = "Whether to enable network egress metering for this cluster. If enabled, a daemonset will be created in the cluster to meter network egress traffic."
  default     = false
}
 
variable "enable_resource_consumption_export" {
  type        = bool
  description = "Whether to enable resource consumption metering on this cluster. When enabled, a table will be created in the resource export BigQuery dataset to store resource consumption data. The resulting table can be joined with the resource usage table or with BigQuery billing export."
  default     = true
}
/*
variable "node_pools_taints" {
  type        = map(list(object({ key = string, value = string, effect = string })))
  description = "Map of lists containing node taints by node-pool name"
 
  # Default is being set in variables_defaults.tf
  default = {
    all               = {}
    default-node-pool = {}
  }
}*/
 
variable "node_pools_tags" {
  type        = map(list(string))
  description = "Map of lists containing node network tags by node-pool name"
 
  # Default is being set in variables_defaults.tf
  default = {
    all               = []
    default-node-pool = []
  }
}
 
variable "node_pools_oauth_scopes" {
  type        = map(list(string))
  description = "Map of lists containing node oauth scopes by node-pool name"
 
  # Default is being set in variables_defaults.tf
  default = {
    all               = ["https://www.googleapis.com/auth/cloud-platform"]
    default-node-pool = []
  }
}

variable "network_tags" {
  description = "(Optional) - List of network tags applied to auto-provisioned node pools."
  type        = list(string)
  default     = []
}
 
variable "stub_domains" {
  type        = map(list(string))
  description = "Map of stub domains and their resolvers to forward DNS queries for a certain domain to an external DNS server"
  default     = {}
}
 
variable "upstream_nameservers" {
  type        = list(string)
  description = "If specified, the values replace the nameservers taken by default from the node’s /etc/resolv.conf"
  default     = []
}
 
variable "non_masquerade_cidrs" {
  type        = list(string)
  description = "List of strings in CIDR notation that specify the IP address ranges that do not use IP masquerading."
  default     = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}
 
variable "ip_masq_resync_interval" {
  type        = string
  description = "The interval at which the agent attempts to sync its ConfigMap file from the disk."
  default     = "60s"
}
 
variable "ip_masq_link_local" {
  type        = bool
  description = "Whether to masquerade traffic to the link-local prefix (169.254.0.0/16)."
  default     = false
}
 
variable "configure_ip_masq" {
  type        = bool
  description = "Enables the installation of ip masquerading, which is usually no longer required when using aliasied IP addresses. IP masquerading uses a kubectl call, so when you have a private cluster, you will need access to the API server."
  default     = false
}
 
variable "cluster_resource_labels" {
  type        = map(string)
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster"
  default     = {}
}
 
 
variable "deploy_using_private_endpoint" {
  type        = bool
  description = "A toggle for Terraform and kubectl to connect to the master's internal IP address during deployment."
  default     = false
}
 
variable "enable_private_endpoint" {
  type        = bool
  description = "Whether the master's internal IP address is used as the cluster endpoint"
  default     = false
}
 
variable "enable_private_nodes" {
  type        = bool
  description = "Whether nodes have internal IP addresses only"
  default     = true
}
 
variable "master_ipv4_cidr_block" {
  type        = string
  description = "(Optional) The IP range in CIDR notation to use for the hosted master network."
  default     = null
}
 
variable "private_endpoint_subnetwork" {
  type        = string
  description = "The subnetwork to use for the hosted master network."
  default     = null
}
 
variable "master_global_access_enabled" {
  type        = bool
  description = "Whether the cluster master is accessible globally (from any region) or only within the same region as the private endpoint."
  default     = true
}
 
variable "dns_cache" {
  type        = bool
  description = "The status of the NodeLocal DNSCache addon."
  default     = false
}
 
variable "authenticator_security_group" {
  type        = string
  description = "The name of the RBAC security group for use with Google security groups in Kubernetes RBAC. Group name must be in format gke-security-groups@yourdomain.com"
  default     = null
}
 
variable "identity_namespace" {
  description = "The workload pool to attach all Kubernetes service accounts to. (Default value of `enabled` automatically sets project-based pool `[project_id].svc.id.goog`)"
  type        = string
  default     = "enabled"
}
 
variable "enable_mesh_certificates" {
  type        = bool
  default     = false
  description = "Controls the issuance of workload mTLS certificates. When enabled the GKE Workload Identity Certificates controller and node agent will be deployed in the cluster. Requires Workload Identity."
}
 
variable "gateway_api_channel" {
  type        = string
  description = "The gateway api channel of this cluster. Accepted values are `CHANNEL_STANDARD` and `CHANNEL_DISABLED`."
  default     = null

}


variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the cluster."
  default     = true
}
 
variable "fleet_enabled" {

  description = "(Optional) Register the cluster with the fleet in this project."
  type        = bool
  default     = false
}

/*
variable "workload_alts_config" {
  type = list(object({
    enable_alts = bool
  })) 
} */


variable "min" {
  type = number
  default = "10000"
}

variable "max" {
  type = number
  default = "99999"
}

variable "random_suffix" {
  type = bool
  description = "This will add random suffix of 5 digts to our name"
}














