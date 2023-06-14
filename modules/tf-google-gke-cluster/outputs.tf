# ${path.module} is an interpolated string in Terraform, which references the path to the current
# module. In this case, it returns the path to the directory containing the current module.

output "kubeconfig" {
  value       = "${path.module}/kubeconfig"
  description = "The path to the kubeconfig file"
}

output "name" {
  value = google_container_cluster.this.name
}
