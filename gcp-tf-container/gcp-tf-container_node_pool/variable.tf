variable "cluster" {
    type = string
}

variable "location" {
    type = string
}


variable "autoscaling" {
 type = list(object({
    min_node_count = number
    max_node_count = number
     total_min_node_count = number
     total_max_node_count = number
     location_policy = string
 }))
}

variable "initial_node_count" {
    type = number
}

variable "management" {
    type = list(object({
     auto_repair= bool
     auto_upgrade = bool
    }))
}

variable "max_pods_per_node" {
 type = number
} 

variable "node_locations" {
 type = list(string)
} 

variable "node_pool_name" {
  type = string
}
 
 /*
variable "name_prefix" {
 type = string
} 
*/

/*
variable "node_count" {
 type = number
}
*/

variable "project_id" {
 type = string
}


variable "version_node_pool" {
    type = string

} //checking the codition

variable "placement_policy" {
 type = list(object({
    type = string
    policy_name = string
    tpu_topology = string
 }))
}

variable "queued_provisioning" {
    type = list(object({
    enabled = bool
  }))
    
}

variable "reservation_affinity" {
    type = list(object({
        consume_reservation_type =  string
        key =  string
        values = string
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