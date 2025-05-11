provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "voting_app" {
  metadata {
    name = "voting-app"
  }
}

resource "kubernetes_config_map" "app_config" {
  metadata {
    name      = "app-config"
    namespace = kubernetes_namespace.voting_app.metadata[0].name
  }

  data = {
    environment = "production"
    log_level   = "info"
  }
}