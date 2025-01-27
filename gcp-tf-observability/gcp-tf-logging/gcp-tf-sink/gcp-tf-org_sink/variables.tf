variable "name" {
  description                 = "(Required) The name of the logging sink."
  type                        = string
}
variable "org_id" {
  description                 = "(Required) The numeric ID of the organization to be exported to the sink."
  type                        = string
}
variable "destination" {
  description                 = "(Required) The destination of the sink (or, in other words, where logs are written to). Can be a Cloud Storage bucket, a PubSub topic, a BigQuery dataset, a Cloud Logging bucket, or a Google Cloud project."
  type                        = string
}
variable "filter" {
  description                 = "(Optional) The filter to apply when exporting logs. Only log entries that match the filter are exported."
  type                        = string
}
variable "description" {
  description                 = "(Optional) A description of this sink. The maximum length of the description is 8000 characters."
  type                        = string
}
variable "disabled" {
  description                 = "(Optional) If set to True, then this sink is disabled and it does not export any log entries."
  type                        = bool
}
variable "include_children" {
  description                 = "(Optional) Whether or not to include children organizations in the sink export."
  type                        = bool
  #default                     = true
}
variable "intercept_children" {
  description                 = "(Optional) Whether or not to intercept children organizations in the sink export."
  type                        = bool
  #default                     = true
}
variable "bigquery_options" {
  description                 = "(Optional) Options that affect sinks exporting data to BigQuery."
  type                        = object({
    use_partitioned_tables    = bool
  })
  default                     = null
  /* {
    use_partitioned_tables  = false
  } */
}
variable "exclusions" {
  description                 = "(Optional) Log entries that match any of the exclusion filters will not be exported. If a log entry is matched by both filter and one of exclusions.filter, it will not be exported."
  type                        = list(object({
    name                      = string,
    description               = string,
    filter                    = string,
    disabled                  = bool
  }))
  default                     = [
    /* {
      name                    = null
      description             = null
      filter                  = null
      disabled                = false
    } */
  ]
}