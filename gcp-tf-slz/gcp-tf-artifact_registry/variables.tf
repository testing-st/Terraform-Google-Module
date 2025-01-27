variable "project" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}
variable "repository_id" {
  description ="The last part of the repository name"
  type = string
}
variable "format" {
  description = "The format of packages that are stored in the repository."
  type        = string
}

variable "location" {
  description = "The name of the location this repository is located in."
  type        = string
}
variable "description" {
  description = "The user-provided description of the repository."
  type        = string
    
}
variable "labels" {
  description  = "Label keys and values may be no longer than 63 characters"
  type = map(string)
}
variable "kms_key_name" {
  description = "The Cloud KMS resource name of the customer managed encryption key that is used to encrypt the contents of the Repository."
  type = string 
}
variable "docker_config" {
  type = list(object({
    immutable_tags = bool
  })) 
  description = "Docker repository config contains repository level configuration for the repositories of docker type."
}

variable "maven_config" {
  type =  list(object({
    allow_snapshot_overwrites = list(string)
    version_policy            = list(string) 
  }))
  description = "MavenRepositoryConfig is maven related repository details."
}
variable "virtual_repository_config" {
  type = list(object({
    virtual_repository_config = list(object({
      upstream_policies = list(object({
        id  = string
        repository =  string
        priority =  string
      })) 
    }))
  })) 
  description = " Configuration specific for a Virtual Repository"
}
variable "mode" {
  type = string
  description = "The mode configures the repository to serve artifacts from different sources."
}
variable "cleanup_policies" {
  type = list(object({
    id =  string
    action = string
    condition  = list(object({
      tag_state =  string
      tag_prefixes = list(string)
      version_name_prefixes  = list(string)
      package_name_prefixes  = list(string)
      older_than  = string
      newer_than = string
    }))
    most_recent_versions  = list(object({
      package_name_prefixes =  list(string)
      keep_count = number
    }))
  }))
  description = " Cleanup policies indicate when certain package versions can be automatically deleted."
}
variable "remote_repository_config" {
  type = list(object({
    apt_repository = list(object({
      public_repository = list(object({
        repository_base = string
        repository_path = string
      })) 
    })) 
    docker_repository = list(object({
      public_repository = string
      custom_repository = list(object({
        uri = string
      }))
    }))
    maven_repository = list(object({
      public_repository = string
      custom_repository = list(object({
        uri = string
      })) 
    }))
    npm_repository = list(object({
      public_repository = string
      custom_repository = list(object({
        uri = string
      }))
    }))
    python_repository = list(object({
      public_repository = string
      custom_repository = list(object({
        uri = string
      }))
    }))
    yum_repository = list(object({
      public_repository = list(object({
        repository_base = string
        repository_path = string
      }))
    }))
    upstream_credentials = list(object({
      username_password_credentials = list(object({
        username = string
        password_secret_version = string
      }))
    }))
    disable_upstream_validation = string
  }))
  description = " Configuration specific for a Remote Repository."
}
variable "cleanup_policy_dry_run" {
  type        = bool
  description = "If true, the cleanup pipeline is prevented from deleting versions in this repository"
}