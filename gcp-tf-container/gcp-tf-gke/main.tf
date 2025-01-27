resource "random_integer" "random-suffix" {
min = var.min
max = var.max
}

resource "google_container_cluster" "primary" {
  provider             = google
    name               = var.random_suffix == true?("${var.name}-${resource.random_integer.random-suffix.result}"):var.name
    location           = var.location
    deletion_protection = var.deletion_protection
    node_locations = var.node_locations
    project        = var.project_id
    dynamic "addons_config" {
      for_each  = var.addons_config
      content {
          dynamic "http_load_balancing" {
            for_each = lookup(addons_config.value,"http_load_balancing")
              content {
                disabled = lookup(http_load_balancing.value,"disabled")
                   }
          }
          dynamic "horizontal_pod_autoscaling" {
            for_each = lookup(addons_config.value,"horizontal_pod_autoscaling")
            content {
              disabled = lookup(horizontal_pod_autoscaling.value,"disabled")
              }
          }
          dynamic "network_policy_config" {
            for_each = lookup(addons_config.value,"network_policy_config")
              content {
                disabled = lookup(network_policy_config.value,"disabled")
            }
          }
          dynamic "dns_cache_config" {
            for_each =  lookup(addons_config.value,"dns_cache_config") 
              content {
                enabled = lookup(dns_cache_config.value,"enabled")
          }
        }
          dynamic "gcp_filestore_csi_driver_config" {
           for_each =  lookup(addons_config.value,"gcp_filestore_csi_driver_config") 
             content {
                enabled = lookup(gcp_filestore_csi_driver_config.value,"enabled")
          }
        }
          dynamic "gce_persistent_disk_csi_driver_config" {
            for_each = lookup(addons_config.value,"gce_persistent_disk_csi_driver_config")
              content {
              enabled = lookup(gce_persistent_disk_csi_driver_config.value,"enabled")
              }
        }
          dynamic "config_connector_config" {
            for_each = lookup(addons_config.value , "config_connector_config")
              content {
                enabled = lookup(config_connector_config.value,"enabled")
              }
        }
          dynamic "gke_backup_agent_config" {
            for_each = lookup(addons_config.value ,"gke_backup_agent_config")
              content {
                  enabled = lookup(gke_backup_agent_config.value,"enabled")
            }
        }
          dynamic "gcs_fuse_csi_driver_config" {
            for_each = lookup(addons_config.value,"gcs_fuse_csi_driver_config")
              content {
                enabled = lookup(gcs_fuse_csi_driver_config.value,"enabled")
          }
        }
          dynamic "cloudrun_config" {
            for_each = lookup(addons_config.value,"cloudrun_config")
              content {
                  disabled = lookup(cloudrun_config.value,"disabled")
                  load_balancer_type = lookup(cloudrun_config.value,"load_balancer_type")
          }
        }
          dynamic "stateful_ha_config" {
            for_each = lookup(addons_config.value,"stateful_ha_config")
              content {
                enabled = lookup(stateful_ha_config.value,"enabled")
          }
        }
         /* dynamic "kalm_config" {
            for_each = lookup(addons_config.value,"kalm_config")
              content {
                  enabled = lookup(kalm_config.value,"enabled")
          }
        } */
        /*  dynamic "istio_config" {
            for_each = lookup(addons_config.value,"istio_config")
              content {
                disabled = lookup(istio_config.value,"disabled")
                auth = lookup(istio_config.value,"auth")
          }
        } */
        dynamic "ray_operator_config" {
            for_each = lookup(addons_config.value,"ray_operator_config")
              content {
                enabled = ray_operator_config.value.enabled
            dynamic "ray_cluster_logging_config" {
              for_each = lookup(ray_operator_config.value,"ray_cluster_logging_config") 
                content {
                    enabled = ray_cluster_logging_config.value.enabled
                }
            }
            dynamic "ray_cluster_monitoring_config" {
                for_each = lookup(ray_operator_config.value,"ray_cluster_monitoring_config") 
                content {
                    enabled = ray_cluster_monitoring_config.value.enabled
                }
            }
          }
        }
      }
     # parallelstore_csi_driver_config = var.parallelstore_csi_driver_config
    }
    network = var.network
    subnetwork = var.subnetwork
    allow_net_admin = var.allow_net_admin
    cluster_ipv4_cidr   = var.cluster_ipv4_cidr
    datapath_provider = var.datapath_provider
    description = var.description
    enable_kubernetes_alpha = var.enable_kubernetes_alpha
    enable_tpu              = var.enable_tpu
    enable_legacy_abac      = var.enable_legacy_abac
    networking_mode         = var.networking_mode
   # node_version            = var.node_version
    resource_labels         = var.resource_labels
    remove_default_node_pool  = var.remove_default_node_pool
    enable_intranode_visibility                  = var.enable_intranode_visibility
    enable_l4_ilb_subsetting                     = var.enable_l4_ilb_subsetting
    enable_multi_networking                      = var.enable_multi_networking
   # enable_fqdn_network_policy                   = var.enable_fqdn_network_policy
    private_ipv6_google_access                   = var.private_ipv6_google_access
    enable_cilium_clusterwide_network_policy     = var.enable_cilium_clusterwide_network_policy
     dynamic "enable_k8s_beta_apis" {
      for_each                                  = var.enable_k8s_beta_apis
      content {                           
        enabled_apis                            = lookup(enable_k8s_beta_apis.value, "enabled_apis")
      }
    }
    dynamic "confidential_nodes" {
        for_each = var.confidential_nodes
        content {
          enabled = confidential_nodes.value.enabled
        }
    }
    dynamic "default_snat_status" {
      for_each = var.default_snat_status
      content {
        disabled = lookup(default_snat_status.value,"disabled")
      }
    }
      
    dynamic "cluster_autoscaling" {
      for_each = var.cluster_autoscaling
      content {
      enabled = cluster_autoscaling.value.enabled

      dynamic "resource_limits" {
        for_each = lookup(cluster_autoscaling.value, "resource_limits")
          content {
            resource_type = resource_limits.value.resource_type
            minimum = resource_limits.value.minimum
            maximum = resource_limits.value.maximum
        }
      }
      #auto_provisioning_locations = var.cluster_autoscaling.auto_provisioning_locations
      dynamic "auto_provisioning_defaults" {
        for_each = lookup(cluster_autoscaling.value, "auto_provisioning_defaults")
          content {
            service_account = lookup(auto_provisioning_defaults.value, "service_account" )
            oauth_scopes    = lookup(auto_provisioning_defaults.value, "oauth_scopes" )
            boot_disk_kms_key = lookup(auto_provisioning_defaults.value, "boot_disk_kms_key" )
            min_cpu_platform = lookup(auto_provisioning_defaults.value, "min_cpu_platform" )
            management {
              auto_repair  = lookup(auto_provisioning_defaults.value, "auto_repair", true)
              auto_upgrade = lookup(auto_provisioning_defaults.value, "auto_upgrade", true)
            }
            disk_size = lookup(auto_provisioning_defaults.value, "disk_size", 100)
            disk_type = lookup(auto_provisioning_defaults.value, "disk_type", "pd-standard")
            upgrade_settings {
              strategy        = lookup(auto_provisioning_defaults.value, "strategy", "SURGE")
              max_surge       = lookup(auto_provisioning_defaults.value, "strategy", "SURGE") == "SURGE" ? lookup(auto_provisioning_defaults.value, "max_surge", 0) : null
              max_unavailable = lookup(auto_provisioning_defaults.value, "strategy", "SURGE") == "SURGE" ? lookup(auto_provisioning_defaults.value, "max_unavailable", 0) : null

              dynamic "blue_green_settings" {
                for_each = lookup(cluster_autoscaling, "strategy", "SURGE") == "BLUE_GREEN" ? [1] : []
                content {
                  node_pool_soak_duration = lookup(cluster_autoscaling, "node_pool_soak_duration", null)

                  standard_rollout_policy {
                    batch_soak_duration = lookup(cluster_autoscaling, "batch_soak_duration", null)
                    batch_percentage    = lookup(cluster_autoscaling, "batch_percentage", null)
                    batch_node_count    = lookup(cluster_autoscaling, "batch_node_count", null)
                  }
                }
              }
            }

            shielded_instance_config {
              enable_secure_boot          = lookup(cluster_autoscaling, "enable_secure_boot", false)
              enable_integrity_monitoring = lookup(cluster_autoscaling, "enable_integrity_monitoring", true)
            }
            image_type = lookup(cluster_autoscaling, "image_type", "COS_CONTAINERD")
          }
        }

     # auto_provisioning_locations = var.cluster_autoscaling.auto_provisioning_locations
      autoscaling_profile = lookup(cluster_autoscaling.value, "autoscaling_profile")

          }
    }
   # min_master_version = var.min_master_version
    dynamic "master_auth" {
      for_each                                  = var.master_auth
      content { 
        dynamic "client_certificate_config" {
          for_each                              = lookup(master_auth.value, "client_certificate_config" , "")
          content {
            issue_client_certificate            = lookup(client_certificate_config.value, "issue_client_certificate" , "")
          }
        }
      }
    }
    dynamic "master_authorized_networks_config" {
      for_each                                  = var.master_authorized_networks_config
      content {
        dynamic "cidr_blocks" {
          for_each                              = lookup(master_authorized_networks_config.value, "cidr_blocks" )
          content {
            cidr_block                          = lookup(cidr_blocks.value, "cidr_block")
            display_name                        = lookup(cidr_blocks.value, "display_name" )
          #  private_endpoint_enforcement_enabled  = lookup(cidr_blocks.value, "private_endpoint_enforcement_enabled" )
          }
        }
        gcp_public_cidrs_access_enabled         = lookup(master_authorized_networks_config.value, "gcp_public_cidrs_access_enabled")
      }
    }
    dynamic "logging_config" {
          for_each                                  = var.logging_config
          content {
            enable_components                       = lookup(logging_config.value, "enable_components")
          }
        }
        logging_service                             = var.logging_service

      dynamic "monitoring_config" {
          for_each                                  = var.monitoring_config
          content {
            enable_components                       = lookup(monitoring_config.value, "enable_components" )
            dynamic "managed_prometheus" {
              for_each                              = lookup(monitoring_config.value, "managed_prometheus" )
              content {                            
                enabled                             = lookup(managed_prometheus.value, "enabled" )
              }
            }
            dynamic "advanced_datapath_observability_config" {
              for_each                              = lookup(monitoring_config.value, "advanced_datapath_observability_config" , "")
              content {                     
                enable_metrics                      = lookup(advanced_datapath_observability_config.value, "enable_metrics")
                enable_relay                        = lookup(advanced_datapath_observability_config.value, "enable_relay")
              }
            }

          }
     }
        monitoring_service                          = var.monitoring_service
      enable_shielded_nodes = var.enable_shielded_nodes
     # enable_autopilot  = var.enable_autopilot
      default_max_pods_per_node = var.default_max_pods_per_node
      initial_node_count    = var.initial_node_count

      dynamic "fleet" {
        for_each = var.fleet_enabled?[1]:[]
        content {
          project = fleet.value.project
        }
      }

      dynamic "binary_authorization" {
        for_each = var.binary_authorization
        content {
          evaluation_mode = binary_authorization.value.evaluation_mode
        }
      }
      dynamic "service_external_ips_config" {
      for_each                                  = var.service_external_ips_config
          content {
               enabled                          = lookup(service_external_ips_config.value, "enabled" , "")
          }
      }
      dynamic "mesh_certificates" {
      for_each                                  = var.mesh_certificates
      content {                    
        enable_certificates                     = lookup(mesh_certificates.value, "enable_certificates" , "")
         }
       }
      dynamic "database_encryption" {
      for_each                                  = var.database_encryption
      content {                              
        state                                   = lookup(database_encryption.value, "state" , "")
        key_name                                = lookup(database_encryption.value, "key_name" , "")
      }
    }
    dynamic "ip_allocation_policy" {
      for_each    = var.ip_allocation_policy
      content {
        cluster_secondary_range_name  = lookup(ip_allocation_policy.value,"cluster_secondary_range_name")
        services_secondary_range_name = lookup(ip_allocation_policy.value,"services_secondary_range_name")
        services_ipv4_cidr_block =lookup(ip_allocation_policy.value,"services_ipv4_cidr_block")  //will remove this ..it is not in google module
        cluster_ipv4_cidr_block =lookup(ip_allocation_policy.value,"cluster_ipv4_cidr_block")//will remove this ..it is not in google module
        
        dynamic "additional_pod_ranges_config" {
          for_each = lookup(ip_allocation_policy.value,"additional_pod_ranges_config")
          content {
            pod_range_names = lookup(additional_pod_ranges_config.value,"pod_range_names")
          }
        }
        stack_type = lookup(ip_allocation_policy.value,"stack_type")
      }
    }
      dynamic "maintenance_policy" {
        for_each = var.maintenance_policy
        content {
        dynamic "recurring_window" {
          for_each = lookup(maintenance_policy.value,"recurring_window")
          content {
            start_time = recurring_window.value.start_time
            end_time   = recurring_window.value.end_time
            recurrence = recurring_window.value.recurrence
          }
        }

        dynamic "daily_maintenance_window" {
          for_each =  lookup(maintenance_policy.value,"daily_maintenance_window")
          content {
            start_time = daily_maintenance_window.value.start_time
          }
        }

        dynamic "maintenance_exclusion" {
          for_each = lookup(maintenance_policy.value,"maintenance_exclusion")
          content {
            exclusion_name = maintenance_exclusion.value.exclusion_name
            start_time     = maintenance_exclusion.value.start_time
            end_time       = maintenance_exclusion.value.end_time

            dynamic "exclusion_options" {
              for_each = lookup(maintenance_exclusion.value,"exclusion_options")
              content {
                scope = exclusion_options.value.scope
              }
            }
          }
        }
      }
      }

    dynamic "network_policy" {
      for_each                                  = var.network_policy
      content {                               
        provider                                = lookup(network_policy.value, "provider" )
        enabled                                 = lookup(network_policy.value, "enabled" , "")
      }
    }

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
    /*    dynamic "sandbox_config" {
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
    dynamic "node_pool" {
      for_each                                  = var.node_pool
      content {      
        name                                    = lookup(node_pool.value, "name" , "")
        initial_node_count                      = lookup(node_pool.value, "initial_node_count" , "")
      }
    }
    dynamic "notification_config" {
      for_each                                  = var.notification_config
      content {
        dynamic "pubsub" {
          for_each                              = lookup(notification_config.value, "pubsub" , "")
          content {
            enabled                              = lookup(pubsub.value, "enabled", "")
            topic                               = lookup(pubsub.value, "topic", "")
           dynamic "filter"  {
              for_each   = lookup(pubsub.value, "filter", "")
              content {
                 event_type = lookup(filter.value, "event_type")
              }
           }                           
          }
        }
      }
    }
    dynamic "node_pool_auto_config" {
      for_each                                  = var.node_pool_auto_config
      content {
        resource_manager_tags                   = lookup(node_pool_auto_config.value, "resource_manager_tags","")
        dynamic "network_tags" {
          for_each                              = lookup(node_pool_auto_config.value, "network_tags", "")
          content {
            tags                                = lookup(network_tags.value, "tags","")
          }
        }
        dynamic "node_kubelet_config" {
          for_each                              = lookup(node_pool_auto_config.value, "node_kubelet_config" , "")
          content {
           insecure_kubelet_readonly_port_enabled     = lookup(node_kubelet_config.value, "insecure_kubelet_readonly_port_enabled")
          }
        } 
      }
    }  
    dynamic "node_pool_defaults" {
      for_each                                  = var.node_pool_defaults
      content {
        dynamic "node_config_defaults" {
          for_each                              = lookup(node_pool_defaults.value, "node_config_defaults" , "")
          content {
          #  insecure_kubelet_readonly_port_enabled  = lookup(node_config_defaults.value, "insecure_kubelet_readonly_port_enabled")
            logging_variant                         = lookup(node_config_defaults.value, "logging_variant" , "")
        dynamic "gcfs_config" {
            for_each                              = lookup(node_config_defaults.value, "gcfs_config" , "")
            content {
              enabled                            = lookup(gcfs_config.value, "enabled" , "")
        }                       
          }
        }
      }
    }
    }
   /* dynamic "pod_security_policy_config" {
      for_each                                   = var.pod_security_policy_config
      content {
        enabled                                  = lookup(pod_security_policy_config.value, "enabled" , "")
      }
    } */
    dynamic "authenticator_groups_config" {
      for_each                                   = var.authenticator_groups_config
      content {                          
        security_group                           = lookup(authenticator_groups_config.value, "security_group" , "")
      }
    }
    dynamic "private_cluster_config" {
      for_each                                   = var.private_cluster_config
      content {
        enable_private_nodes                     = lookup(private_cluster_config.value, "enable_private_nodes" )
        enable_private_endpoint                  = lookup(private_cluster_config.value, "enable_private_endpoint" )
       # master_ipv4_cidr_block                   = lookup(private_cluster_config.value, "master_ipv4_cidr_block" )
        private_endpoint_subnetwork              = lookup(private_cluster_config.value, "private_endpoint_subnetwork") 
        dynamic "master_global_access_config" {
          for_each                               = lookup(private_cluster_config.value, "master_global_access_config" , "")
          content {
            enabled                              = lookup(private_cluster_config.value, "enabled",false)
          }
        }

      }
    }
 /*   dynamic "cluster_telemetry" {
      for_each                                   = var.cluster_telemetry
      content {
        type                                     = lookup(cluster_telemetry.value, "type","")
      }
    } */
    dynamic "release_channel" {
      for_each                                   = var.release_channel
      content {
        channel                                  = lookup(release_channel.value, "channel" , "")
      }
    }
    dynamic "cost_management_config" {
      for_each                                   = var.cost_management_config
      content {
        enabled                                  = lookup(cost_management_config.value, "enabled" )
      }
    }
    dynamic "resource_usage_export_config" {
      for_each                                   = var.resource_usage_export_config
      content {
        enable_network_egress_metering           = lookup(resource_usage_export_config.value, "enable_network_egress_metering" )
        enable_resource_consumption_metering     = lookup(resource_usage_export_config.value, "enable_resource_consumption_metering" ,false)
        dynamic "bigquery_destination" {
          for_each                               = lookup(resource_usage_export_config.value, "bigquery_destination" , "")
          content {
            dataset_id                           = lookup(bigquery_destination.value, "dataset_id" )
          }
        }
      }
    }
    dynamic "vertical_pod_autoscaling" {
      for_each                                   = var.vertical_pod_autoscaling
      content  {
        enabled                                  = lookup(vertical_pod_autoscaling.value , "enabled" , "")
      }
    }
    dynamic "workload_identity_config" {
      for_each                                   = var.workload_identity_config
      content {
        workload_pool                            = lookup(workload_identity_config.value, "workload_pool" , "")
      }
    }
    dynamic "identity_service_config" {
      for_each                                   = var.identity_service_config
      content  {
        enabled                                  = lookup(identity_service_config.value, "enabled" , "")
      }
    }
    dynamic "dns_config" {
      for_each                                   = var.dns_config
      content {           
       # additive_vpc_scope_dns_domain            = lookup(dns_config.value, "additive_vpc_scope_dns_domain" )
        cluster_dns                              = lookup(dns_config.value, "cluster_dns" , "")
        cluster_dns_domain                       = lookup(dns_config.value, "cluster_dns_domain" , "")
        cluster_dns_scope                     = lookup(dns_config.value, "cluster_dns_scope" , "")   
      }
    } 
    dynamic "gateway_api_config" {
      for_each                                   = var.gateway_api_config
      content {
        channel                                  = lookup(gateway_api_config.value, "channel" , "")
      }
    }
  /* dynamic "protect_config" {
      for_each                                   = var.protect_config
      content {
        dynamic "workload_config" {
          for_each                   = lookup(protect_config.value, "workload_config")
          content {
              audit_mode = workload_config.value.audit_mode
          }
        }
        workload_vulnerability_mode              = lookup(protect_config.value , "workload_vulnerability_mode")
      }
    }*/
    dynamic "security_posture_config" {
      for_each                                   = var.security_posture_config
      content {
        mode                                     = lookup(security_posture_config.value, "mode")
        vulnerability_mode                       = lookup(security_posture_config.value, "vulnerability_mode")
      }
      
    }
 /*   dynamic "workload_alts_config" {
      for_each                                   = var.workload_alts_config
      content {
        enable_alts                              = lookup(workload_alts_config.value, "enable_alts" , "")
      }
    }  */

    lifecycle {
      ignore_changes = [dns_config]
    }

}
