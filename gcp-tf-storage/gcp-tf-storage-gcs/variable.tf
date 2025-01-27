variable "project_id" {
  description = "The ID of the project to create the bucket in."
  type        = string
}
 
variable "location" {
  description = "The location of the bucket. See https://cloud.google.com/storage/docs/locations."
  type        = string
}
 
variable "name" {
  description = "The name of the bucket."
  type        = string
}
 
variable "force_destroy" {
  description = "When deleting a bucket, this boolean option will delete all contained objects. If false, Terraform will fail to delete buckets which contain objects."
  type        = bool
  #default     = false
}
 
/* variable "iam_members" {
  description = "The list of IAM members to grant permissions on the bucket."
  type = list(object({
    role   = string
    member = string
  }))
  #default = []
} */
 
variable "storage_class" {
  description = "The Storage Class of the new bucket."
  type        = string
  default     = ""
}
 
variable "labels" {
  description = "A set of key/value label pairs to assign to the bucket."
  type        = map(string)
  default     = {}
}
 
/* variable "bucket_policy_only" {
  description = "Enables Bucket Policy Only access to a bucket."
  type        = bool
  #default     = true
} */
 
variable "versioning" {
  description = "While set to true, versioning is fully enabled for this bucket."
  type        = list(object({
    enabled = bool
  }))
  #default     = true
}
 
variable "autoclass" {
  description = "While set to true, autoclass is enabled for this bucket."
  type        = list(object({
    enabled                = bool
    terminal_storage_class = string
  }))
  #default     = false
}
 
variable "lifecycle_rule" {
  description = "Defines lifecycle rules for storage buckets."
  type = list(object({
    action = list(object({
      type          = string
      storage_class = optional(string)
    }))
    condition = list(object({
      age                        = optional(number)
      created_before             = optional(string)
      with_state                 = optional(string)
      matches_storage_class      = optional(list(string))
      matches_prefix             = optional(list(string))
      matches_suffix             = optional(list(string))
      num_newer_versions         = optional(number)
      custom_time_before         = optional(string)
      days_since_custom_time     = optional(number)
      days_since_noncurrent_time = optional(number)
      noncurrent_time_before     = optional(string)
    }))
  }))
  default = []
}
 
variable "website" {
  description = "List of website configuration objects."
  type = list(object({
    main_page_suffix = optional(string)
    not_found_page   = optional(string)
  }))
  default = []
}
 
variable "cors" {
  description = "List of CORS configurations."
  type = list(object({
    origin          = optional(list(string))
    method          = optional(list(string))
    response_header = optional(list(string))
    max_age_seconds = optional(number)
  }))
  default = []
}
 
variable "default_event_based_hold" {
  description = "Enables #default event-based hold on new objects."
  type        = bool
  #default     = false
}
 
variable "custom_placement_config" {
  description = "Configuration of the bucket's custom location in a dual-region bucket setup. If the bucket is designated a single or multi-region, the variable is null."
  type = list(object({
    data_locations = list(string)
  }))
  default = []
}
 
variable "retention_policy" {
  description = "Defines retention policies for the bucket."
  type = list(object({
    is_locked        = bool
    retention_period = number
  }))
  #default = null
}
 
variable "encryption" {
  description = "Defines the encryption configuration for the bucket."
  type = list(object({
    default_kms_key_name = string
  }))
  default = []
}
 
variable "enable_object_retention" {
  description = "Enable object retention for the bucket."
  type        = bool
  #default     = false
}
 
variable "requester_pays" {
  description = "When set to true, requester pays for data access."
  type        = bool
  #default     = false
}
 
/* variable "rpo" {
  description = "Defines the Recovery Point Objective DEFAULT, ASYNC_TURBO for the bucket."
  type        = string
  default     = ""
} */
 
 
variable "uniform_bucket_level_access" {
  description = "Enables uniform bucket-level access."
  type        = bool
  #default     = true
}
 
variable "public_access_prevention" {
  description = "Prevents public access to the bucket."
  type        = string
  #default     = "inherited" or "enforced"
}
 
variable "soft_delete_policy" {
  description = "Defines soft delete policies for objects in the bucket."
  type = list(object({
    retention_duration_seconds = number
    #effective_time             = string
  }))
  default = []
}
 
variable "hierarchical_namespace" {
  description = "Enables hierarchical namespace for the bucket."
  type = list(object({
    enabled = bool
  }))
  #default = null
}
 
variable "logging" {
  description = "Defines logging configuration for the bucket."
  type = list(object({
    log_bucket        = string
    log_object_prefix = string
  }))
  default = []
}