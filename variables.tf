# GCP variables
variable "GOOGLE_PROJECT" {
  type        = string
  description = "GCP project name"
}
variable "GOOGLE_REGION" {
  type        = string
  default     = "us-central1-c"
  description = "GCP region to use"
}
variable "GKE_NUM_NODES" {
  type        = number
  default     = 2
  description = "GKE nodes number"
}

# Github vars
variable "GITHUB_OWNER" {
  type        = string
  description = "The GitHub owner"
}
variable "GITHUB_TOKEN" {
  type        = string
  description = "GitHub personal access token"
}
variable "FLUX_GITHUB_REPO" {
  type        = string
  default     = "flux-gitops"
  description = "GitHub repository"
}

# kube-ctl variables
variable "KUBE_CONFIG_PATH" {
  type = string
  default = "kubeconfig"
  description = "The path to the kubeconfig file"
}
