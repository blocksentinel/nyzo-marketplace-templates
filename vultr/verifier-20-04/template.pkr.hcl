# Nyzo Marketplace Templates
# © 2022 Block Sentinel LLC.
# This code is licensed under Apache 2.0 license (see LICENSE for details)

variable "vultr_api_key" {
  type      = string
  default   = "${env("VULTR_API_KEY")}"
  sensitive = true
}

packer {
  required_plugins {
    vultr = {
      version = ">=v2.3.2"
      source  = "github.com/vultr/vultr"
    }
  }
}

source "vultr" "nyzo-verifier" {
  api_key              = "${var.vultr_api_key}"
  os_id                = "387"
  plan_id              = "vc2-1c-2gb"
  region_id            = "ewr"
  snapshot_description = "Nyzo Verifier ${formatdate("YYYY-MM-DD hh:mm", timestamp())}"
  ssh_username         = "root"
  state_timeout        = "25m"
}

build {
  sources = ["source.vultr.nyzo-verifier"]

  provisioner "file" {
    source      = "../helper-scripts/vultr-helper.sh"
    destination = "/root/vultr-helper.sh"
  }

  provisioner "file" {
    source      = "files/etc/"
    destination = "/etc/"
  }

  provisioner "file" {
    source      = "files/var/"
    destination = "/var/"
  }

  provisioner "shell" {
    script        = "template.sh"
    remote_folder = "/root"
    remote_file   = "template.sh"
  }
}
