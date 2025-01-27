# General settings
project_id       = "optical-scarab-443717-b3"
location         = "US"
name             = "optical-scarab-443717-b3"
force_destroy    = false
storage_class    = "STANDARD"
default_event_based_hold = false
enable_object_retention  = false
requester_pays           = false
#rpo                      = "DEFAULT"
uniform_bucket_level_access = true
public_access_prevention = "enforced"

# Labels
labels = {
  environment = "production"
  team        = "devops"
}

# Autoclass settings
autoclass = [
  {
    enabled                = false
    terminal_storage_class = "NEARLINE"
  }
]

# Lifecycle rules
lifecycle_rule = [
  {
    action = [
      {
        type          = "Delete"
        storage_class = null
      }
    ]
    condition = [
      {
        age               = 30
        send_age_if_zero  = false
        created_before    = null
        with_state        = "LIVE"
        matches_storage_class = ["STANDARD"]
        matches_prefix    = ["logs/"]
        matches_suffix    = [".log"]
        num_newer_versions = null
      }
    ]
  }
]

# Versioning
versioning = [
  {
    enabled = false
  }
]

# Website configuration
website = [
  {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
]

# CORS configuration
cors = [
  {
    origin          = ["*"]
    method          = ["GET", "POST"]
    response_header = ["Content-Type"]
    max_age_seconds = 3600
  }
]

# Retention policy
retention_policy = [
  {
    is_locked       = false
    retention_period = 86400
  }
]

# Logging configuration
logging = [
  {
    log_bucket        = "your-log-bucket"
    log_object_prefix = "logs/"
  }
]

# Encryption
/* encryption = [
  {
    default_kms_key_name = "projects/your-project-id/locations/global/keyRings/your-keyring/cryptoKeys/your-key"
  }
] */

# Custom placement config
# custom_placement_config = [
#   {
#     data_locations = "us-central1"
#   }
# ]

# Soft delete policy
soft_delete_policy = [
  {
    retention_duration_seconds = 2592000
    #effective_time             = 1622505600
  }
]

# Hierarchical namespace
hierarchical_namespace = [
  {
    enabled = false
  }
]
