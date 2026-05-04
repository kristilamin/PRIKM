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

resource "docker_image" "prometheus" {
  name         = "prom/prometheus:latest"
  keep_locally = true
}

resource "docker_container" "prometheus" {
  image = docker_image.prometheus.image_id
  name  = "lab8_prometheus"
  ports {
    internal = 9090
    external = 9091
  }
}

resource "docker_image" "grafana" {
  name         = "grafana/grafana:latest"
  keep_locally = true
}

resource "docker_container" "grafana" {
  image = docker_image.grafana.image_id
  name  = "lab8_grafana"
  ports {
    internal = 3000
    external = 3001
  }
}