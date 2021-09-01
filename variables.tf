// deployment
variable "release_name" {
  description = "name of the release of the inspr uidp"
  type = string
  default = "uidp"
}
variable "namespace" {
  description = "namespace in which the uidp components will be deployed to"
  type = string
  default = "inspr"
}


// uidp 
variable "uidp_name" {
  description = "name of the uidp service"
  type = string
  default = "uidp"
}
variable "image_pull_policy" {
  description = "definition of the image policy for the pods"
  type = string
  default = "IfNotPresent"
}
variable "log_level" {
  description = "initial level of the uidp logger, can be changed via insprctl"
  type = string
  default = "info"
}

variable "image_registry" {
  description = ""
  type = string
  default = "gcr.io/insprlabs"
}
variable "image_repository" {
  description = ""
  type = string
  default = "uidp/redis/api"
}
variable "image_tag" {
  description = ""
  type = string
  default = "v0.1.3"
}

// svc config
variable "uidp_svc_type" {
  description = "specifies the type of the uidp service"
  type = string
  default = "ClusterIP"
}
variable "uidp_svc_port" {
  description = "specifies the port of the uidp service"
  type = number
  default = 80
}
variable "uidp_svc_targetPort" {
  description = "specifies the targetPort of the uidp service"
  type = number
  default = 9001
}

variable "secret_image_registry" {
  description = ""
  type = string
  default = "gcr.io/insprlabs"
}
variable "secret_image_repository" {
  description = ""
  type = string
  default = "uidp/redis/secret"
}
variable "secret_image_tag" {
  description = ""
  type = string
  default = "v0.1.3"
}


// admin
variable "admin_generate_password" {
  description = ""
  type = bool
  default = true
}
variable "admin_password" {
  description = ""
  type = string
  default = ""
}


// redis
variable "redis_create" {
  description = ""
  type = bool
  default = false
}
variable "redis_fullname_override" {
  description = ""
  type = string
  default = "redis"
}
variable "redis_password" {
  description = ""
  type = string
  default = ""
}
variable "redis_existing_secret" {
  description = ""
  type = string
  default = "uidp-redis-secret"
}
variable "redis_existing_host" {
  description = ""
  type = string
  default = ""
}
variable "redis_existing_port" {
  description = ""
  type = string
  default = ""
}
variable "redis_cluster_nodes" {
  description = ""
  type = number
  default = 6
}


// ingress
variable "enable_ingress" {
  description = ""
  type = bool
  default = false
}
variable "ingress_host" {
  description = ""
  type = string
  default = ""
}
variable "ingress_class" {
  description = ""
  type = string
  default = "nginx"
}



// insprd svc connection variables
variable "insprd_name" {
  description = ""
  type = string
  default = "insprd"
}
variable "insprd_init_enabled" {
  description = ""
  type = bool
  default = false
}
variable "insprd_init_secret_key" {
  description = ""
  type = string
  default = ""
}
variable "insprd_init_secret_name" {
  description = ""
  type = string
  default = ""
}
variable "insprd_address" {
  description = ""
  type = string
  default = "http://insprd:80"
}
variable "insprd_token" {
  description = ""
  type = string
  default = ""
}

