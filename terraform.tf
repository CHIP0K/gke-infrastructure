terraform {
  backend "gcs" {
    bucket = "chip-tfstates"
    prefix = "terraform/state"
  }
}
