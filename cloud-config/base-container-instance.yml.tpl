#cloud-config

bootcmd:
  - mkdir -p /etc/ecs
  - echo 'ECS_CLUSTER=${ecs_cluster_name}' >> /etc/ecs/ecs.config
  - echo 'ECS_ENGINE_AUTH_TYPE=dockercfg' >> /etc/ecs/ecs/config
  - echo 'ECS_ENGINE_AUTH_DATA={"${ecs_private_registry}":{"auth":"${ecs_private_registry_auth_data}"}}' >> /etc/ecs/ecs/config
