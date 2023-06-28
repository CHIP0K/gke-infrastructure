# Create SSH keys for deployment
module "tls_private_key" {
  source    = "./modules/tf-hashicorp-tls-keys"
  algorithm = "RSA"
}

# Create github reppo
module "github_repository" {
  source                   = "./modules/tf-github-repository"
  github_owner             = var.GITHUB_OWNER
  github_token             = var.GITHUB_TOKEN
  repository_name          = var.FLUX_GITHUB_REPO
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux-ssh-pub-key"
}

# Create GKE cluster
module "gke_cluster" {
  source         = "./modules/tf-google-gke-cluster"
  config_path    = var.KUBE_CONFIG_PATH
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = var.GKE_NUM_NODES
}

# FuxCD
module "flux_bootstrap" {
  source            = "./modules/tf-fluxcd-flux-bootstrap"
  github_repository = "${var.GITHUB_OWNER}/${var.FLUX_GITHUB_REPO}"
  target_path       = var.FLUX_CLUSTER_PATH
  private_key       = module.tls_private_key.private_key_pem
  config_path       = var.KUBE_CONFIG_PATH
  github_token      = var.GITHUB_TOKEN
}
