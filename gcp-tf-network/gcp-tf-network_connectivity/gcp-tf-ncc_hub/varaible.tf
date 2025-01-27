variable "project_id" {
  description = "The ID of the Google Cloud project where the Network Connectivity Hub will be created." 
  type        = string
}
 
variable "hub_name" {
  description = "The name of the Network Connectivity Hub."
  type        = string
}

variable "description" {
  description = "Description of the Network Connectivity Hub."
  type        = string
}

variable "labels" {
  description = "Labels to be attached to the buckets"
  type        = map(string)
}
variable "export_psc" {
  description = "(Optional) Whether Private Service Connect transitivity is enabled for the hub. If true, Private Service Connect endpoints in VPC spokes attached to the hub are made accessible to other VPC spokes attached to the hub. The default value is false."
  type        = bool
}