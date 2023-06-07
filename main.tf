terraform {
  backend "gcs" {
    bucket = "chip-tfstates"
    prefix = "terraform/state"
  }
}
module "gke_cluster" {
  source         = "github.com/CHIP0K/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = var.GKE_NUM_NODES
}
