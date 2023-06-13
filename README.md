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
| <a name="module_gke_cluster"></a> [gke\_cluster](#module\_gke\_cluster) | github.com/CHIP0K/tf-google-gke-cluster | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_GOOGLE_PROJECT"></a> [GOOGLE\_PROJECT](#input\_GOOGLE\_PROJECT) | GCP project name | `string` | n/a | yes |
| <a name="input_GKE_NUM_NODES"></a> [GKE\_NUM\_NODES](#input\_GKE\_NUM\_NODES) | GKE nodes number | `number` | `1` | no |
| <a name="input_GOOGLE_REGION"></a> [GOOGLE\_REGION](#input\_GOOGLE\_REGION) | GCP region to use | `string` | `"us-central1-c"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->