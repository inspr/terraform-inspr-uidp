terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.2.0"
    }
  }
}

resource "helm_release" "uidp" {
  repository = "https://inspr-charts.storage.googleapis.com"
  chart      = "uidp"

  // deployment
  name      = var.release_name
  namespace = var.namespace
  create_namespace = true

  // waits for all jobs to be done in cluster
  wait = true
  wait_for_jobs = true

  // uidp svc
  set {
    name = "name"
    value = var.uidp_name
  }
  set {
    name = "imagePullPolicy"
    value = var.image_pull_policy
  }
  set {
    name = "logLevel"
    value = var.log_level
  }

  // image section
  set {
    name = "image.registry"
    value = var.image_registry
  }
  set {
    name = "image.repository"
    value = var.image_repository
  }
  set {
    name = "image.tag"
    value = var.image_tag
  }
  
  // uidp svc config
  set {
    name = "service.type"
    value = var.uidp_svc_type
  }
  set {
    name = "service.port"
    value = var.uidp_svc_port
  }
  set {
    name = "service.targetPort"
    value = var.uidp_svc_targetPort
  }

  // secret
  set {
    name = "secret.image.registry"
    value = var.secret_image_registry
  }
  set {
    name = "secret.image.repository"
    value = var.secret_image_repository
  }
  set {
    name = "secret.image.tag"
    value = var.secret_image_tag
  }

  // admin
  set {
    name = "admin.generatePassword"
    value = var.admin_generate_password
  }
  set {
    name = "admin.password"
    value = var.admin_password
  }

  // redis
  set {
    name = "redis.create"
    value = var.redis_create
  }
  set {
    name = "redis.fullNameOverride"
    value = var.redis_fullname_override
  }
  set {
    name = "redis.password"
    value = var.redis_password
  }
  set {
    name = "redis.existingSecret"
    value = var.redis_existing_secret
  }
  set {
    name = "redis.existing.host"
    value = var.redis_existing_host
  }
  set {
    name = "redis.existing.port"
    value = var.redis_existing_port
  }
  set {
    name = "redis.cluster.nodes"
    value = var.redis_cluster_nodes
  }

  // ingress
  set {
    name = "ingress.enabled"
    value = var.enable_ingress
  }
  set {
    name = "ingress.host"
    value = var.enable_ingress == true ? var.ingress_host : ""
  }
  set {
    name = "ingress.class"
    value = var.enable_ingress == true ? var.ingress_class : ""
  }


  // insprd
  set {
    name = "insprd.name"
    value = var.insprd_name
  }
  set {
    name = "insprd.init.enabled"
    value = var.insprd_init_enabled
  }
  set {
    name = "insprd.init.secret.key"
    value = var.insprd_init_secret_key
  }
  set {
    name = "insprd.init.secret.name"
    value = var.insprd_init_secret_name
  }
  set {
    name = "insprd.address"
    value = var.insprd_address
  }
  set {
    name = "insprd.token"
    value = var.insprd_token
  }
}

