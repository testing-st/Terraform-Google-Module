#...................................................... locals ..........................................................#

variable "project_id" {
  type        = string
  description = "The project id to be used"
}
variable "global_address_type" {
  type        = string
  description = "The type of the address to reserve."
}

#................................................... Global Address .....................................................#

variable "global_address_name" {
  type        = string
  description = "The address name"
}
variable "global_address_description" {
  type        = string
  description = "An optional description of this resource."
}
variable "global_address_purpose" {
  type        = string
  description = "The purpose of the address"
}
variable "global_address_prefix_length" {
  type        = number
  description = "The length of the address"
}
variable "global_address_network" {
  type        = string
  description = "The network of the address"
}
variable "labels" {
  type        = map(string)
  description = "(Optional) Labels to apply to this address. A list of key->value pairs."
}
variable "global_address_ip" {
  type        = string
  description = "static address"
}


variable "network" {
  type        = string
  description = "The network of the address"
}
variable "service" {
  type        = string
  description = "private service"
}
variable "ranges" {
  type        = list(any)
  description = "private service ip ranges"
}
variable "deletion_policy" {
  description = " (Optional) The deletion policy for the service networking connection. Setting to ABANDON allows the resource to be abandoned rather than deleted. This will enable a successful terraform destroy when destroying CloudSQL instances. Use with care as it can lead to dangling resources."
  type = string
}
variable "update_on_creation_fail" {
  description = "(Optional) When set to true, enforce an update of the reserved peering ranges on the existing service networking connection in case of a new connection creation failure."
  type = string
}
