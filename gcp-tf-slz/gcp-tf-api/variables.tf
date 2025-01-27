variable "project_id" {
  description = "The GCP project you want to enable APIs on"
  type        = string
}

variable "gcp_apis_list" {
  description ="The list of apis necessary for the project"
  type = list(string)
}

variable "disable_apis_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_on_destroy"
  default     = true
  type        = bool
}

variable "disable_dependent_apis" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_dependent_services"
  default     = true
  type        = bool
}
