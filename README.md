# microservice-project-otus
URL project : http://kvosems.ru

## Terraform Yandex Cloud Managed Service for Kubernetes
Для автоматизации развертывания Managed Service for Kubernetes в Yandex Cloud используется Terraform, для его использования необходимо выполнить след. шаги:
1. В косноле Yandex Cloud необходимо создать платежный аккаунт или убедиться в его наличии. Используя инструкцию по ссылке: [подготовка](https://yandex.cloud/ru/docs/managed-kubernetes/operations/kubernetes-cluster/kubernetes-cluster-create)
2. Далее необходимо подготовить Terrafrom к работе, выполнить это необходимо по следующей инструкции: [установка terraform](https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-quickstart#cli_1). Инструкция показывает об установке terraform, создании данных для аутентификации, настройки провайдера, конфигурации terraform.
3. Конфигурация terraform:

   ```terraform/cluster.tf``` - описание конфигурации Managed Service for Kubernetes.
   
   ```terraform/nodes_group.tf``` - описание конфигурации групп узлов worker node кластера k8s.
5. Проверка созданной конфигурации:
   ```
   terraform plan
   ```
6. Применение созданной конфигурации:
   ```
   terraform apply
   ```
## Работа с кластером k8s
1. Установка yc cli [инструкция](https://yandex.cloud/ru/docs/cli/operations/install-cli)
2. Установка kubectl [инструкция](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
3. Далее сконфигурируем конфиг файл для kubectl
   ```
   yc k8s cluster get-credentials k8s-project --folder-id <folder-id> --external
   ```
4. Проверка работы kubectl
   ```
   kubectl get nodes
   ```
5. Taint and labels для групп узлов infra
   ```
   kubectl taint nodes prod-awan-cl10l1bci20paorqmrpg node-role=k8s-project-infra:NoSchedule
   kubectl label nodes prod-awan-cl10l1bci20paorqmrpg k8s-project-infra=true
   ```
   
## ArgoCD
