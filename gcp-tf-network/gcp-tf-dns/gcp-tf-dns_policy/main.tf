
resource "google_dns_policy" "dns_policy" {
  name                      = var.policy_name
  description               = var.description
  enable_inbound_forwarding = var.enable_inbound_forwarding
  enable_logging            = var.policy_enable_logging
  project                   = var.project_id

  dynamic "alternative_name_server_config" {
    for_each = var.target_name_servers
    content {
      target_name_servers {
        ipv4_address    = alternative_name_server_config.value.ipv4_address
        forwarding_path = alternative_name_server_config.value.forwarding_path
      }
    }
  }

  dynamic "networks" {
    for_each = var.networks
    content {
      network_url = networks.value.network_url
    }
  }
}


# # #########################################################
# # /*google google_dns_response_policy block started there*/
# # #########################################################

# resource "google_dns_response_policy" "response_policy" {
#   response_policy_name = var.response_policy_name
#   description          = var.policy_rule_description
#   project              = local.project_id

#   dynamic "networks" {
#     for_each = var.policy_rule_networks
#     content {
#       network_url = policy_rule_networks.value.network_url
#     }
#   }

#   dynamic "gke_clusters" {
#     for_each = var.policy_rule_gke_clusters
#     content {
#       gke_cluster_name = policy_rule_gke_clusters.value.gke_cluster_name
#     }
#   }
# }

# # #########################################################
# # /*google google_dns_response_policy_rule block started there*/
# # #########################################################

# resource "google_dns_response_policy_rule" "response_policy_rule" {
#   response_policy = var.response_policy
#   rule_name       = var.rule_name
#   dns_name        = local.domain
#   project         = local.project_id

#   dynamic "local_data" {
#     for_each = var.local_data
#     content {
#       dynamic "local_datas" {
#         for_each = local_data.value.local_datas
#         content {
#           name    = local_datas.value.name
#           type    = local_datas.value.type
#           ttl     = local_datas.value.ttl
#           rrdatas = local_datas.value.rrdatas
#         }
#       }
#     }
#   }
# }

