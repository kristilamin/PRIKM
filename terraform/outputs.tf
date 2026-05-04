output "app_container" {
  value = docker_container.app.name
}

output "prometheus_container" {
  value = docker_container.prometheus.name
}

output "grafana_container" {
  value = docker_container.grafana.name
}