resource "yandex_lb_target_group" "k8s-project-app" {
  name      = "k8s-project-app"
  region_id = "ru-central1"

  target {
    subnet_id = "${yandex_vpc_subnet.k8s-network-ru-central1-d.id}"
    address   = "10.132.0.22"
  }
  target {
    subnet_id = "${yandex_vpc_subnet.k8s-network-ru-central1-d.id}"
    address   = "10.132.0.31"
  }
  target {
    subnet_id = "${yandex_vpc_subnet.k8s-network-ru-central1-d.id}"
    address   = "10.132.0.37"
  }
}