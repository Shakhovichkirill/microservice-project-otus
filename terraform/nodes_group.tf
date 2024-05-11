resource "yandex_kubernetes_node_group" "k8s-project-infra" {
  cluster_id = yandex_kubernetes_cluster.k8s-project.id
  name       = "k8s-project-infra"
  
  labels = {
    "k8s-project-infra" = true
  }

  instance_template {
    name       = "prod-{instance.short_id}-{instance_group.id}"
    platform_id = "standard-v2"
    network_acceleration_type = "standard"
    network_interface {
      nat = true
      subnet_ids = ["${yandex_vpc_subnet.k8s-network-ru-central1-d.id}"]
    }
    container_runtime {
     type = "containerd"
    }
  }
  scale_policy {
    fixed_scale {
      size = 1
    }
}
}
resource "yandex_kubernetes_node_group" "k8s-project-work" {
  cluster_id = yandex_kubernetes_cluster.k8s-project.id
  name       = "k8s-project-work"
  
  labels = {
    "k8s-project-work" = true
  }

  instance_template {
    name       = "prod-{instance.short_id}-{instance_group.id}"
    platform_id = "standard-v2"
    network_acceleration_type = "standard"
    network_interface {
       nat = true
      subnet_ids = ["${yandex_vpc_subnet.k8s-network-ru-central1-d.id}"]
    }
    container_runtime {
     type = "containerd"
    }
  }
  scale_policy {
    fixed_scale {
      size = 3
    }
}
}