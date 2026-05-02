output "eks_endpoint" {
  value = module.platform_eks.cluster_endpoint
}

output "ecr_url" {
  value = module.platform_registry.registry_url
}

output "api_gateway_url" {
  value = module.platform_api.api_endpoint
}

output "data_lake_arn" {
  value = module.platform_lake.lake_arn
}
