resource "google_artifact_registry_repository" "repo" {
    project       							                          = var.project
    repository_id 							                          = var.repository_id
    format        							                          = var.format
    location      							                          = var.location
    description   							                          = var.description
    labels        							                          = var.labels
    kms_key_name  							                          = var.kms_key_name

    dynamic "docker_config" {         
        for_each 								                      = var.docker_config[*]
        content {               
            immutable_tags 						                      = lookup(docker_config.value, "immutable_tags" , "")
        }               
    }                 
    dynamic "maven_config" {                
        for_each 								                       = var.maven_config[*]
        content {         
            allow_snapshot_overwrites 			                      = lookup(maven_config.value, "allow_snapshot_overwrites", "")
            version_policy            			                      = lookup(maven_config.value,"version_policy", "")
        }         
    }         
    mode        								                      =   var.mode

    dynamic "virtual_repository_config" {         
        for_each 								                      = var.virtual_repository_config  
        content {         
            dynamic "upstream_policies" {         
                for_each 							                  = lookup(virtual_repository_config.value, "upstream_policies", [])
                content {         
                    id                      		                  = lookup(upstream_policies.value,"id","") 
                    repository              		                  = lookup(upstream_policies.value, "repository","")
                    priority                		                  = lookup(upstream_policies.value, "priority" ,"")
                }                 
            }         
        }         
    }         

    dynamic "cleanup_policies" {          
        for_each                                                      = var.cleanup_policies[*]
        content {         
            id                         			                      = lookup(cleanup_policies.value,"id","")
            action                     			                      = lookup(cleanup_policies.value,"action","")
            dynamic "condition"{          
                for_each                                              = lookup(cleanup_policies.value, "condition",[])
                content{          
                    tag_state               		                  = lookup(condition.value,"tag_state","")
                    tag_prefixes            		                  = lookup(condition.value,"tag_prefixes","")
                    version_name_prefixes   		                  = lookup(condition.value,"version_name_prefixes","")
                    package_name_prefixes   		                  = lookup(condition.value,"package_name_prefixes","")
                    older_than              		                  = lookup(condition.value,"older_than","")
                    newer_than              		                  = lookup(condition.value,"newer_than","")
                }         
            }         
            dynamic "most_recent_versions" {        
                for_each                                              = lookup(cleanup_policies.value, "most_recent_versions", [])
                content {       
                    package_name_prefixes               	          = lookup(most_recent_versions.value,"package_name_prefixes","")
                    keep_count                          	          = lookup(most_recent_versions.value, "keep_count","")
                }       
            }       
        }           
    }
    dynamic "remote_repository_config" {
        for_each 								                      = var.remote_repository_config[*]
        content {       
            description               			                      = lookup(remote_repository_config.value, "description","")
            dynamic "apt_repository" {        
                for_each 							                  = lookup(remote_repository_config.value,"apt_repository",[])
                content{        
                    dynamic "public_repository" {       
                        for_each                                      = lookup(apt_repository.value,"public_repository", [])
                        content{        
                            repository_base   		                  = lookup(public_repository.value,"repository_base","")
                            repository_path   		                  = lookup(public_repository.value,"repository_path","")
                        }       
                    }       
                }             
            }       
            dynamic "docker_repository" {       
                for_each 							                  = lookup(remote_repository_config.value,"docker_repository", [])
                content {       
                    public_repository 				                  = lookup(docker_repository.value,"public_repository","")
                    dynamic "custom_repository" {       
                        for_each 						              = lookup(docker_repository.value,"custom_repository", [])
                        content {       
                            uri      						          = lookup(custom_repository.value, "uri","")
                        }       
                    }       
                }           
            }       
            dynamic "maven_repository" {        
                for_each 							                  = lookup(remote_repository_config.value, "maven_repository", [])
                content {       
                    public_repository 				                  = lookup(maven_repository.value, "public_repository","")
                    dynamic "custom_repository" {       
                        for_each 						              = lookup(maven_repository.value, "custom_repository", [])
                        content {       
                            uri   						              = lookup(custom_repository.value, "uri","")
                        }       
                    }       
                }               
            }       
            dynamic "npm_repository" {        
                for_each 							                  = lookup(remote_repository_config.value,"npm_repository", [])
                content {       
                    public_repository   				              = lookup(npm_repository.value,"public_repository","")
                    dynamic "custom_repository" {       
                        for_each 						              = lookup(npm_repository.value,"custom_repository", [])
                        content {       
                            uri 							          = lookup(custom_repository.value,"uri","")
                        }             
                    }         
                }               
            }       
            dynamic "python_repository" {       
                for_each 							                  = lookup(remote_repository_config.value,"python_repository", [])
                content {       
                    public_repository    				              = lookup(python_repository.value,"public_repository","")   
                    dynamic "custom_repository" {       
                        for_each 						              = lookup(python_repository.value,"custom_repository", [])
                        content {       
                            uri    						              = lookup(custom_repository.value, "uri","")
                        }       
                    }         
                }               
            }       
            dynamic "yum_repository" {        
                for_each 							                  = lookup(remote_repository_config.value,"yum_repository", [])
                content {       
                    dynamic "public_repository"{        
                        for_each 						              = lookup(yum_repository.value,"public_repository", [])
                        content {       
                            repository_base   		                  = lookup(public_repository.value,"repository_base","")
                            repository_path   		                  = lookup(public_repository.value,"repository_path","")
                        }       
                    }
                }        
            }
            dynamic "upstream_credentials" {
                for_each 							                  = lookup(remote_repository_config.value,"upstream_credentials", [])
                content {
                    dynamic "username_password_credentials" {
                        for_each 						              = lookup(upstream_credentials.value,"username_password_credentials", [])
                        content {
                            username                                  = lookup(username_password_credentials.value,"username","")
                            password_secret_version     	          = lookup(username_password_credentials.value,"password_secret_version","")
                        }
                    }
                }     
            }
            disable_upstream_validation 			                  = lookup(remote_repository_config.value,"disable_upstream_validation","")
        }   
    }
    cleanup_policy_dry_run    				                          =  var.cleanup_policy_dry_run  
}
