# Inspr's UIDP terraform module

This is a module responsible for installing the terraform module into a
cluster.

## Usage

```hcl
module "insprd" {
  source = "inspr/daemon/inspr"
  providers = {
       helm = helm.inspr 
  }

  namespace = "daemon-namespace"
  apps_namespace = "dapps-namespace"

  enable_ingress = true
  ingress_host = "tf.inspr.dev"
  ingress_class = "nginx"
}
```

### Examples of helm configuration

The inspr daemon module uses the
[https://registry.terraform.io/providers/hashicorp/helm/latest](helm module) to
install the service into your kubernetes cluster. The module itself receives a helm
provider configuration, allowing to use configuration like the ones that can be
found in the [https://registry.terraform.io/providers/hashicorp/helm/latest/docs
](documentation). A few examples are:

```hcl
// local kubernetes config, will install into the currently selected cluster
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
```

```hcl
// receives the authentication of the cluster in which the installation will
// occur
provider "helm" {
  kubernetes {
    host     = "https://cluster_endpoint:port"

    client_certificate     = file("~/.kube/client-cert.pem")
    client_key             = file("~/.kube/client-key.pem")
    cluster_ca_certificate = file("~/.kube/cluster-ca-cert.pem")
  }
}
```



### Complete example

Below is a more through example on how to add the daemon module using in a
specific cluster.

```hcl

// terraform cluster - just a zonal cluster from a local module
module "tfc" {
  source       = "./modules/zonal-cluster"
  project_id   = "insprlabs"
  cluster_name = "tf-presentation"
  location     = "us-central1-a"
  min_nodes    = 1
  max_nodes    = 3
  machine_type = "e2-standard-2"
}

// creation of a custom helm provider configuration, specifies that the helm
// will install its components on 'tfc'
provider "helm" {
  alias = "inspr"

  kubernetes {
    host                   = module.tfc.endpoint
    cluster_ca_certificate = base64decode(module.tfc.cluster_ca_certificate)
    client_certificate     = module.tfc.client_certificate
    client_key             = module.tfc.client_key
  }
}

module "insprd" {
  depends_on = [ module.tfc ]
  source = "inspr/daemon/inspr"
  providers = {
       helm = helm.inspr 
  }

  namespace = "inspr"
  apps_namespace = "inspr-apps"

  enable_ingress = false
  ingress_host = "tf.inspr.dev"
  ingress_class = "nginx"
}
```



