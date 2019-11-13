provider "google" {
 
project     = "learned-vault-251805"
  region      = "us-central1"
  
}


resource "google_compute_instance" "default" {
  name         = "testspd"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"
  
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
