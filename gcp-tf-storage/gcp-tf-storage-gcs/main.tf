resource "google_storage_bucket" "bucket" {
    name                   = var.name
    location               = var.location
    force_destroy          = var.force_destroy
    project                = var.project_id
    storage_class          = var.storage_class
    dynamic "autoclass" {
        for_each = var.autoclass[*]
        content {
          enabled                = lookup(autoclass.value, "enabled" , null)
          terminal_storage_class = lookup(autoclass.value, "terminal_storage_class", null)
        }
    }
    dynamic "lifecycle_rule" {
        for_each = var.lifecycle_rule[*]
        content {
          dynamic "action" {
            for_each = lookup(lifecycle_rule.value, "action" , [])
            content {
              type            = lookup(action.value , "type" , null) 
              storage_class   = lookup(action.value, "storage_class" , null)
            }
          }
          dynamic "condition" {
            for_each = lookup(lifecycle_rule.value, "condition", [])
            content {
              age                        = lookup(condition.value, "age", null)
              send_age_if_zero           = lookup(condition.value, "send_age_if_zero", null)
              created_before             = lookup(condition.value, "created_before", null)
              with_state                 = lookup(condition.value, "with_state", null)
              matches_storage_class      = lookup(condition.value, "matches_storage_class", null)
              matches_prefix             = lookup(condition.value, "matches_prefix" , null)
              matches_suffix             = lookup(condition.value, "matches_suffix" ,null)
              num_newer_versions         = lookup(condition.value, "num_newer_versions", null)
              custom_time_before         = lookup(condition.value, "custom_time_before", null)
              days_since_custom_time     = lookup(condition.value, "days_since_custom_time", null)
              days_since_noncurrent_time = lookup(condition.value, "days_since_noncurrent_time", null)
              noncurrent_time_before     = lookup(condition.value, "noncurrent_time_before", null) 

            } 
          }
       }
    }
    dynamic "versioning" {
        for_each = var.versioning[*]
        content {
          enabled = lookup(versioning.value , "enabled" , null)
        } 
    }
    dynamic "website" {
        for_each = var.website[*]
        content {
          main_page_suffix = lookup(website.value, "main_page_suffix", null)
          not_found_page   = lookup(website.value, "not_found_page", null)
        }
    }
    dynamic "cors" {
        for_each = var.cors[*]
        content {
           origin          = lookup(cors.value, "origin", null)
           method          = lookup(cors.value, "method", null)
           response_header = lookup(cors.value, "response_header", null)
           max_age_seconds = lookup(cors.value, "max_age_seconds", null)
        }
    }
    
    default_event_based_hold   = var.default_event_based_hold 

    dynamic "retention_policy" {
        for_each = var.retention_policy[*]
        content {
          is_locked       = lookup(retention_policy.value , "is_locked" , null)
          retention_period = lookup(retention_policy.value , "retention_period" , null)
        }
    }

    labels  = var.labels

    dynamic "logging" {
        for_each = var.logging[*]
        content {
          log_bucket         = lookup(logging.value , "log_bucket", null)
          log_object_prefix  = lookup(logging.value , "log_bucket_prefix", null)
        }
    }
    dynamic "encryption" {
        for_each = var.encryption[*]
        content {
          default_kms_key_name = lookup(encryption.value , "default_kms_key_name", null)
        }
    }

    
    enable_object_retention       = var.enable_object_retention
    requester_pays                = var.requester_pays
    #rpo                           = var.rpo == var.location >= 1 ? var.rpo:null
    uniform_bucket_level_access   = var.uniform_bucket_level_access
    public_access_prevention      = var.public_access_prevention

    dynamic "custom_placement_config" {
        for_each = var.custom_placement_config[*]
        content {
          data_locations = lookup(custom_placement_config.value , "data_locations" , [])
        }
    }
    dynamic "soft_delete_policy" {
        for_each = var.soft_delete_policy[*]
        content {
          retention_duration_seconds = lookup(soft_delete_policy.value, "retention_duration_seconds", null)
          #effective_time             = lookup(soft_delete_policy.value, "effective_time", null)
        }
    }
    dynamic "hierarchical_namespace" {
      for_each = var.hierarchical_namespace[*]
      content {
        enabled = lookup(hierarchical_namespace.value , "enabled" , null)
      }
    }
}        

