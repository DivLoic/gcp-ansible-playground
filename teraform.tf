provider "google" {
  credentials = "${file(".terraform/gcp-credentials.json")}"
  project     = "ansible4gcp"
  region      = "europe-west1"
}

variable "ansible-install-cmd" {
  type = "list",
  default = [
      "sudo apt-get update -y",
      "sudo apt-get install software-properties-common -y",
      "sudo apt-add-repository ppa:ansible/ansible -y",
      "sudo apt-get update -y",
      "sudo apt-get install ansible -y"
    ]
}
resource "google_compute_instance" "controler" {

  name = "ctrl"
  zone = "europe-west1-d"
  machine_type = "n1-standard-2"
  boot_disk {
    initialize_params {
      image = "ubuntu-1710"
    }
  }
  network_interface {
    network = "default"
    access_config { }
  }
  provisioner "remote-exec" {
    inline = "${var.ansible-install-cmd}"
    connection {
      user = "loicmdivad"
      agent = "true"
      timeout = "30s"
    }
  }
}

resource "google_compute_instance" "app" {

  name = "app01"
  zone = "europe-west1-d"
  machine_type = "n1-standard-2"
  boot_disk {
    initialize_params {
      image = "ubuntu-1710"
    }
  }
  network_interface {
    network = "default"
    access_config { }
  }
}

resource "google_compute_instance" "ldbc" {

  name = "ldbc"
  zone = "europe-west1-d"
  machine_type = "n1-standard-2"
  boot_disk {
    initialize_params {
      image = "ubuntu-1710"
    }
  }
  network_interface {
    network = "default"
    access_config { }
  }
}