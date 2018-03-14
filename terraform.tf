provider "google" {
  credentials = "${file(".terraform/gcp-credentials.json")}"
  project     = "ansible4gcp"
  region      = "europe-west1"
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

  metadata_startup_script = "${file("./scripts/apt-get-ansible.sh")}"
}

resource "google_compute_instance" "loadbalancer" {

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

resource "google_compute_instance" "webapp01" {

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

resource "google_compute_instance" "webapp02" {

  name = "app02"
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

resource "google_compute_instance" "database" {

  name = "db"
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