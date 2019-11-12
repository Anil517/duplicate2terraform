provider "google" {
 credentials = "${file("terraformnew1.json")}"
project     = "lexical-theory-250906"
  region      = "us-west1"
  
}


resource "google_compute_instance" "default" {
  name         = "testsx"
  machine_type = "n1-standard-1"
  zone         = "us-west1-a"
  
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  
}
