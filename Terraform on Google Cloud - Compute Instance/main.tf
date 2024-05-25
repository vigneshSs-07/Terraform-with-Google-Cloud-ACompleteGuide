terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.30.0"
    }
  }
}

provider "google" {

  project = "vaulted-journal-420209"
  region  = "us-east4"
  zone    = "us-east4-a"
}

resource "google_compute_instance" "terraform" {
  name         = "demo-instance-tf"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "caa"
      }
    }
  }


  network_interface {
    network = "default"
    access_config {
    }
  }
}
