# gke-infrastructure

## Before apply

1. Create terraform vars file

```bash
cat > vars.tfvars <<'EOF'
# Github variables
GITHUB_OWNER="USERNAME"
GITHUB_TOKEN="xxxxxxxxxxxx"
FLUX_GITHUB_REPO="flux-gitops"
# GCP variables
GOOGLE_PROJECT = "username-k8s"
GOOGLE_REGION  = "us-central1-c"
GKE_NUM_NODES  = 2

EOF
```



## show cost environment

```bash
infracost breakdown --path . --format table --terraform-var-file ./vars.tfvars
```

## Apply infrastructure

```bash
terraform plan -var-file=./vars.tfvars
terraform apply -var-file=./vars.tfvars
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_flux_bootstrap"></a> [flux\_bootstrap](#module\_flux\_bootstrap) | github.com/den-vasyliev/tf-fluxcd-flux-bootstrap | n/a |
| <a name="module_github_repository"></a> [github\_repository](#module\_github\_repository) | github.com/den-vasyliev/tf-github-repository | n/a |
| <a name="module_gke_cluster"></a> [gke\_cluster](#module\_gke\_cluster) | github.com/den-vasyliev/tf-google-gke-cluster | n/a |
| <a name="module_tls_private_key"></a> [tls\_private\_key](#module\_tls\_private\_key) | github.com/den-vasyliev/tf-hashicorp-tls-keys | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_GITHUB_OWNER"></a> [GITHUB\_OWNER](#input\_GITHUB\_OWNER) | The GitHub owner | `string` | n/a | yes |
| <a name="input_GITHUB_TOKEN"></a> [GITHUB\_TOKEN](#input\_GITHUB\_TOKEN) | GitHub personal access token | `string` | n/a | yes |
| <a name="input_GOOGLE_PROJECT"></a> [GOOGLE\_PROJECT](#input\_GOOGLE\_PROJECT) | GCP project name | `string` | n/a | yes |
| <a name="input_FLUX_GITHUB_REPO"></a> [FLUX\_GITHUB\_REPO](#input\_FLUX\_GITHUB\_REPO) | GitHub repository | `string` | `"flux-gitops"` | no |
| <a name="input_GKE_NUM_NODES"></a> [GKE\_NUM\_NODES](#input\_GKE\_NUM\_NODES) | GKE nodes number | `number` | `2` | no |
| <a name="input_GOOGLE_REGION"></a> [GOOGLE\_REGION](#input\_GOOGLE\_REGION) | GCP region to use | `string` | `"us-central1-c"` | no |
| <a name="input_KUBE_CONFIG_PATH"></a> [KUBE\_CONFIG\_PATH](#input\_KUBE\_CONFIG\_PATH) | The path to the kubeconfig file | `string` | `"kubeconfig"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->