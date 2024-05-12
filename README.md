# microservice-project-otus
URL project : http://kvosems.ru

## Terraform Yandex Cloud Managed Service for Kubernetes
Для автоматизации развертывания Managed Service for Kubernetes в Yandex Cloud используется Terraform, для его использования необходимо выполнить след. шаги:
1. В косноле Yandex Cloud необходимо создать платежный аккаунт или убедиться в его наличии. Используя инструкцию по ссылке: [подготовка](https://yandex.cloud/ru/docs/managed-kubernetes/operations/kubernetes-cluster/kubernetes-cluster-create)
2. Далее необходимо подготовить Terrafrom к работе, выполнить это необходимо по следующей инструкции: [установка terraform](https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-quickstart#cli_1). Инструкция показывает об установке terraform, создании данных для аутентификации, настройки провайдера, конфигурации terraform.
3. Конфигурация terraform:

   ```cluster.tf``` - описание конфигурации Managed Service for Kubernetes.
   ```nodes_group.tf``` - описание конфигурации групп узлов worker node кластера k8s. 
