#cloud-config

bootcmd:
  - mkdir -p /etc/ecs
  - echo 'ECS_CLUSTER=${ecs_cluster_name}' >> /etc/ecs/ecs.config
  - cloud-init-per instance $(echo "OPTIONS=\"--insecure-registry=${ecs_private_registry}\"" > /etc/sysconfig/docker)
