resource "yandex_lb_network_load_balancer" "foo" {
  name = "k8s-project-lb"

  listener {
    name = "frontend-external"
    port = 80
    target_port = 30080
    external_address_spec {
      ip_version = "ipv4"
      address = "158.160.153.215"
    }
  }

  attached_target_group {
    target_group_id = "${yandex_lb_target_group.k8s-project-app.id}"

    healthcheck {
      name = "tcp"
      tcp_options {
        port = 30080
      }
    }
  }
}