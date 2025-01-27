resource "google_compute_router_nat" "nat" {
  provider                            = google_beta
  #count                               = var.create_nat ? 1 : 0
  project                             = var.project_id
  region                              = var.region
  name                                = var.nat_name
  router                              = var.router_name
  nat_ip_allocate_option              = var.nat_ip_allocate_option
  initial_nat_ips                     = var.initial_nat_ips 
  nat_ips                             = var.nat_ip_allocate_option == "MANUAL_ONLY" ? var.nat_ips : null
  drain_nat_ips                       = var.drain_nat_ips 
  source_subnetwork_ip_ranges_to_nat  = var.source_subnetwork_ip_ranges_to_nat
  min_ports_per_vm                    = var.min_ports_per_vm
  max_ports_per_vm                    = var.max_ports_per_vm
  enable_dynamic_port_allocation      = var.enable_dynamic_port_allocation
  type                                =var.type
  udp_idle_timeout_sec                = var.udp_idle_timeout_sec
  icmp_idle_timeout_sec               = var.icmp_idle_timeout_sec
  tcp_established_idle_timeout_sec    = var.tcp_established_idle_timeout_sec
  tcp_transitory_idle_timeout_sec     = var.tcp_transitory_idle_timeout_sec
  tcp_time_wait_timeout_sec           =var.tcp_time_wait_timeout_sec 
  enable_endpoint_independent_mapping = var.enable_endpoint_independent_mapping
  dynamic "subnetwork" {
    for_each                          = var.subnetworks
    content {
      name                            = subnetwork.value.name
      source_ip_ranges_to_nat         = subnetwork.value.source_ip_ranges_to_nat
      secondary_ip_range_names        = contains(subnetwork.value.source_ip_ranges_to_nat, "LIST_OF_SECONDARY_IP_RANGES") ? subnetwork.value.secondary_ip_range_names : []
    }
  }

  dynamic "log_config" {
    for_each                          = var.log_config_enable == true ? [{
      enable                          = var.log_config_enable
      filter                          = var.log_config_filter
    }] : []

    content {
      enable                          = log_config.value.enable
      filter                          = log_config.value.filter
    }
  }
  endpoint_types                      = var.endpoint_types
  dynamic "rules" {
    for_each                          = var.rules
    content {
      rule_number                     = lookup(rules.value, "rule_number", "")
      description                     = lookup(rules.value, "description" ,"")
      match                           = lookup(rules.value, "match" , "")
      dynamic "action" {
        for_each = lookup(rules.value, "action" , [])
        content {
          source_nat_active_ips       = lookup(action.value, "source_nat_active_ips" , "")
          source_nat_drain_ips        = lookup(action.value, "source_nat_drain_ips" , "")
          source_nat_active_ranges    = lookup(action.value, "source_nat_active_ranges" , "")
          source_nat_drain_ranges     = lookup(action.value, "source_nat_drain_ranges" , "")
        }
        
      }
    }
    
  }
  auto_network_tier                  = var.auto_network_tier
}
