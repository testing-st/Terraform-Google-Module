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