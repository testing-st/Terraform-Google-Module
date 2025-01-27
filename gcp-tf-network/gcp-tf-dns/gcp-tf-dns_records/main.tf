# # #############################################
# # /*google dns record set block started there*/
# # #############################################

resource "google_dns_record_set" "dns_records" {
  name         = var.record_name
  managed_zone = var.managed_zone
  type         = var.record_type
  ttl          = var.ttl
  project      = var.project_id

  rrdatas = var.rrdatas 
  dynamic "routing_policy" {
    for_each = var.routing_policies != null ? var.routing_policies : []
    content {
      dynamic "wrr" {
        for_each = routing_policy.value.wrr != null ? [1] : []
        content {
          weight  = routing_policy.value.wrr.weight
          rrdatas = var.dnssec_state == "off" || routing_policy.value.wrr.health_checked_targets == null ? routing_policy.value.wrr.rrdatas : null

          dynamic "health_checked_targets" {
            for_each = routing_policy.value.wrr.health_checked_targets != null && var.rrdatas == null ? [1] : []
            content {
              dynamic "internal_load_balancers" {
                for_each = routing_policy.value.wrr.health_checked_targets.internal_load_balancers != null ? [1] : []
                content {
                  load_balancer_type = lookup(internal_load_balancers.value, "load_balancer_type", null)
                  ip_address         = lookup(internal_load_balancers.value, "ip_address", null)
                  port               = lookup(internal_load_balancers.value, "port", null)
                  ip_protocol        = lookup(internal_load_balancers.value, "ip_protocol", null)
                  network_url        = lookup(internal_load_balancers.value, "network_url", null)
                  project            = lookup(internal_load_balancers.value, "project", null)
                  region             = lookup(internal_load_balancers.value, "region", null)
                }
              }
            }
          }
        }
      }

      dynamic "geo" {
        for_each = routing_policy.value.geo != null ? [1] : []
        content {
          location = routing_policy.value.geo.location
          dynamic "health_checked_targets" {
            for_each = routing_policy.value.geo.health_checked_targets != null ? [1] : []
            content {
              dynamic "internal_load_balancers" {
                for_each = routing_policy.value.geo.health_checked_targets.internal_load_balancers != null ? [1] : []
                content {
                  load_balancer_type = lookup(internal_load_balancers.value, "load_balancer_type", null)
                  ip_address         = lookup(internal_load_balancers.value, "ip_address", null)
                  port               = lookup(internal_load_balancers.value, "port", null)
                  ip_protocol        = lookup(internal_load_balancers.value, "ip_protocol", null)
                  network_url        = lookup(internal_load_balancers.value, "network_url", null)
                  project            = lookup(internal_load_balancers.value, "project", null)
                  region             = lookup(internal_load_balancers.value, "region", null)
                }
              }
            }
          }
        }
      }

      dynamic "primary_backup" {
        for_each = routing_policy.value.primary_backup != null ? [1] : []
        content {
          dynamic "backup_geo" {
            for_each = routing_policy.value.primary_backup.backup_geo != null ? [1] : []
            content {
              location = routing_policy.value.primary_backup.backup_geo.location
              dynamic "health_checked_targets" {
                for_each = routing_policy.value.primary_backup.backup_geo.health_checked_targets != null ? [1] : []
                content {
                  dynamic "internal_load_balancers" {
                    for_each = routing_policy.value.primary_backup.backup_geo.health_checked_targets.internal_load_balancers != null ? [1] : []
                    content {
                      load_balancer_type = lookup(internal_load_balancers.value, "load_balancer_type", null)
                      ip_address         = lookup(internal_load_balancers.value, "ip_address", null)
                      port               = lookup(internal_load_balancers.value, "port", null)
                      ip_protocol        = lookup(internal_load_balancers.value, "ip_protocol", null)
                      network_url        = lookup(internal_load_balancers.value, "network_url", null)
                      project            = lookup(internal_load_balancers.value, "project", null)
                      region             = lookup(internal_load_balancers.value, "region", null)
                    }
                  }
                }
              }
            }
          }

          enable_geo_fencing_for_backups = lookup(routing_policy.value.primary_backup, "enable_geo_fencing_for_backups", false)
          trickle_ratio                  = lookup(routing_policy.value.primary_backup, "trickle_ratio", null)

          dynamic "primary" {
            for_each = routing_policy.value.primary_backup.primary != null ? [1] : []
            content {
              dynamic "internal_load_balancers" {
                for_each = routing_policy.value.primary_backup.primary.internal_load_balancers != null ? [1] : []
                content {
                  load_balancer_type = lookup(internal_load_balancers.value, "load_balancer_type", null)
                  ip_address         = lookup(internal_load_balancers.value, "ip_address", null)
                  port               = lookup(internal_load_balancers.value, "port", null)
                  ip_protocol        = lookup(internal_load_balancers.value, "ip_protocol", null)
                  network_url        = lookup(internal_load_balancers.value, "network_url", null)
                  project            = lookup(internal_load_balancers.value, "project", null)
                  region             = lookup(internal_load_balancers.value, "region", null)
                }
              }
            }
          }
        }
      }
    }
  }
}
