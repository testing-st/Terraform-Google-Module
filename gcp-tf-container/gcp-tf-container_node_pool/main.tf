resource "google_container_node_pool" "nodes" {
        cluster = var.cluster
        location = var.location
    dynamic "autoscaling" {
    for_each = var.autoscaling
    content {
        min_node_count = lookup(autoscaling.value, "min_node_count")
        max_node_count = lookup(autoscaling.value, "max_node_count")
        total_min_node_count = lookup(autoscaling.value, "total_min_node_count")
        total_max_node_count = lookup(autoscaling.value, "total_max_node_count")
        location_policy = lookup(autoscaling.value, "location_policy")
    }
    }
    initial_node_count = var.initial_node_count
    dynamic "management" {
      for_each = var.management 
      content {
        auto_repair= lookup(management.value, "auto_repair")
        auto_upgrade = lookup(management.value, "auto_upgrade")
      }
    }
    max_pods_per_node  = var.max_pods_per_node
    node_locations = var.node_locations
    name = var.node_pool_name
   # name_prefix = var.name_prefix
    dynamic "node_config" {
      for_each                                  = var.node_config
      content {                           
        disk_size_gb                            = lookup(node_config.value, "disk_size_gb")
        disk_type                               = lookup(node_config.value, "disk_type")
        enable_confidential_storage             = lookup(node_config.value, "enable_confidential_storage")
        /*   dynamic "ephemeral_storage_config" {
              for_each                              = lookup(node_config.value, "ephemeral_storage_config")
              content {                    
                local_ssd_count                     = lookup(ephemeral_storage_config.value, "local_ssd_count")
              }
          } */
      dynamic "ephemeral_storage_local_ssd_config" {
          for_each                              = lookup(node_config.value, "ephemeral_storage_local_ssd_config" )
          content {
            local_ssd_count                     = lookup(ephemeral_storage_local_ssd_config.value, "local_ssd_count")
              }
      }
      dynamic "fast_socket" {
        for_each                              = lookup(node_config.value, "fast_socket")
        content {                            
          enabled                             = lookup(fast_socket.value, "enabled")
            }
      }
      dynamic "local_nvme_ssd_block_config" {
        for_each                              = lookup(node_config.value,"local_nvme_ssd_block_config")
        content {                    
          local_ssd_count                     = lookup(local_nvme_ssd_block_config.value, "local_ssd_count")
              }
      }
    logging_variant                         = lookup(node_config.value, "logging_variant")
      dynamic "secondary_boot_disks" {
      for_each                              = lookup(node_config.value, "secondary_boot_disks")
      content {                         
        disk_image                          = lookup(secondary_boot_disks.value,  "disk_image")
        mode                                = lookup(secondary_boot_disks.value, "mode")
      }
      }
      dynamic "gcfs_config" {
              for_each                              = lookup(node_config.value, "gcfs_config")
              content {                            
                enabled                             = lookup(gcfs_config.value, "enabled")
              }
      } 
      dynamic "gvnic" {
              for_each                              = lookup(node_config.value, "gvnic")
              content {                            
                enabled                             = lookup(gvnic.value, "enabled" , "false")
              }
      }
      dynamic "guest_accelerator" {
              for_each                              = lookup(node_config.value, "guest_accelerator")
              content {                            
                type                                = lookup(guest_accelerator.value, "type")
                count                               = lookup(guest_accelerator.value, "count")
                dynamic "gpu_driver_installation_config" {
                  for_each                          = lookup(guest_accelerator.value, "gpu_driver_installation_config")
                  content {
                    gpu_driver_version              = lookup(gpu_driver_installation_config.value, "gpu_driver_version")
                  }
                }
                gpu_partition_size                  = lookup(guest_accelerator.value, "gpu_partition_size")
                dynamic "gpu_sharing_config" {
                  for_each          = lookup(guest_accelerator.value, "gpu_sharing_config" )
                    content {
                        gpu_sharing_strategy           = lookup(gpu_sharing_config.value, "gpu_sharing_strategy")
                        max_shared_clients_per_gpu      = lookup(gpu_sharing_config.value, "max_shared_clients_per_gpu")
                    }
                }
              }
    }
            image_type                              = lookup(node_config.value, "image_type" )
            labels                                  = lookup(node_config.value, "labels" )
            resource_labels                         = lookup(node_config.value, "resource_labels")
            local_ssd_count                         = lookup(node_config.value, "local_ssd_count")
            machine_type                            = lookup(node_config.value, "machine_type" , "")
            metadata                                = lookup(node_config.value, "metadata")
            min_cpu_platform                        = lookup(node_config.value, "min_cpu_platform" , "")
            oauth_scopes                            = lookup(node_config.value, "oauth_scopes")
            preemptible                             = lookup(node_config.value, "preemptible")
            dynamic "reservation_affinity" {
              for_each                              = lookup(node_config.value, "reservation_affinity")
              content {
                consume_reservation_type            = lookup(reservation_affinity.value, "consume_reservation_type" , "")
                key                                 =  lookup(reservation_affinity.value, "key" )
                values                              = lookup(reservation_affinity.value, "values")
              }
              
            }
            spot                                    = lookup(node_config.value, "spot" )
        /*  dynamic "sandbox_config" {
              for_each                              = lookup(node_config.value, "sandbox_config" , "")
              content {
                sandbox_type                        = lookup(sandbox_config.value, "sandbox_type" , "")
                }
            } */
            boot_disk_kms_key                       = lookup(node_config.value, "boot_disk_kms_key" , "")
            service_account                         =  lookup(node_config.value, "service_account" , "")
            dynamic "shielded_instance_config" {
              for_each                              = lookup(node_config.value, "shielded_instance_config" , "")
              content {
                enable_secure_boot                  = lookup(shielded_instance_config.value, "enable_secure_boot" , "")
                enable_integrity_monitoring         = lookup(shielded_instance_config.value, "enable_integrity_monitoring" , "")
              }
            }
            tags                                    = lookup(node_config.value, "tags" , "")
            resource_manager_tags                   = lookup(node_config.value, "resource_manager_tags" , "")
            dynamic "taint" {
              for_each                              = lookup(node_config.value, "taint" , "")
              content {
                key                                 = lookup(taint.value, "key" )
                value                               = lookup(taint.value, "value" )
                effect                              = lookup(taint.value, "effect" )
              }
            }
            dynamic "workload_metadata_config" {
              for_each                              = lookup(node_config.value , "workload_metadata_config" )
              content {
                mode                                = lookup(workload_metadata_config.value, "mode" , "")
              }
            }
            dynamic "kubelet_config" {
              for_each                              = lookup(node_config.value, "kubelet_config" , "")
              content {              
                cpu_manager_policy                  = lookup(kubelet_config.value, "cpu_manager_policy", "")
                cpu_cfs_quota                       = lookup(kubelet_config.value, "cpu_cfs_quota", "")
                cpu_cfs_quota_period                = lookup(kubelet_config.value, "cpu_cfs_quota_period", "")
                pod_pids_limit                      = lookup(kubelet_config.value, "pod_pids_limit", "")
              }
            }
            dynamic "linux_node_config" {
              for_each                              = lookup(node_config.value, "linux_node_config")
              content {                        
                sysctls                             = lookup(linux_node_config.value, "sysctls")
                cgroup_mode                         = lookup(linux_node_config.value, "cgroup_mode")

              }
            }
            node_group                              = lookup(node_config.value, "node_group" , "")
            dynamic "sole_tenant_config" {
              for_each                              = lookup(node_config.value, "sole_tenant_config")
              content {
                dynamic "node_affinity" {
                  for_each                          = lookup(sole_tenant_config.value, "node_affinity" )
                  content {
                    key                             = lookup(node_affinity.value, "key")
                    operator                        = lookup(node_affinity.value, "operator")
                    values                          =  lookup(node_affinity.value, "values")
                  }
                }
              }
            }
            dynamic "advanced_machine_features" {
              for_each                              = lookup(node_config.value, "advanced_machine_features" , "")
              content { 
                threads_per_core                    = lookup(advanced_machine_features.value, "threads_per_core" , "")
                enable_nested_virtualization        = lookup(advanced_machine_features.value, "enable_nested_virtualization" , "")
              }  
            }
          }
        }
    #node_count = var.node_count
    project = var.project_id
    version = var.version_node_pool //checking the codition
    dynamic "placement_policy" {
        for_each = var.placement_policy
        content {
          type = lookup(placement_policy, "type")
          policy_name = lookup(placement_policy,"policy_name")
          tpu_topology = lookup(placement_policy,"tpu_toplogy")
        }
      }

      dynamic "queued_provisioning" {
        for_each = var.queued_provisioning
        content {
          enabled = lookup(queued_provisioning, "enabled")
        }
      }

/*
    dynamic "reservation_affinity" {
        for_each = var.reservation_affinity
        content {
        consume_reservation_type =  lookup(reservation_affinity, "consume_reservation_type")
        key =  lookup(reservation_affinity, "key")
        values =  lookup(reservation_affinity, "values")
        }
    }

    */
}