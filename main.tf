# AWS module
module "aws" {
  source                  = "./aws"
  ssh_private_key_data    = var.ssh_private_key_data == null ? file(var.ssh_private_key_file) : var.ssh_private_key_data
  key_name                = var.key_name
  region                  = var.aws_region
  privx_superuser         = var.privx_superuser
  instance_type_privx     = var.aws_instance_type
  instance_type_privx_web = var.aws_instance_type_web
  enable_web              = var.enable_web
}


# Azure module
module "azure" {
  source               = "./azure"
  ssh_private_key_data = var.ssh_private_key_data == null ? file(var.ssh_private_key_file) : var.ssh_private_key_data
  ssh_pub_key_data     = var.ssh_pub_key_data == null ? file(var.ssh_pub_key_file) : var.ssh_pub_key_data
  region               = var.azure_region
  privx_superuser      = var.privx_superuser
  privx_vmsize         = var.azure_vmsize
  privx_web_vmsize     = var.azure_web_vmsize
  enable_web           = var.enable_web
}


# GCP module
module "gcloud" {
  source               = "./gcloud"
  ssh_private_key_data = var.ssh_private_key_data == null ? file(var.ssh_private_key_file) : var.ssh_private_key_data
  ssh_pub_key_data     = var.ssh_pub_key_data == null ? file(var.ssh_pub_key_file) : var.ssh_pub_key_data
  region               = var.gcp_region
  project-id           = var.gcp_project_id
  zone                 = var.gcp_zone
  privx_superuser      = var.privx_superuser
  machine_typeprivx    = var.gcp_machine_type
  machine_typeprivxweb = var.gcp_machine_type_web
  enable_web           = var.enable_web
}
