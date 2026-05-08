terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "app" {
  image = docker_image.nginx.image_id
  name  = "lab8_app"
  ports {
    internal = 80
    external = 8086
  }
}