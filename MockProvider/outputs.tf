
output "VPC_PRIMARY_SERVICE_NAME" {
  description = "vpc endpoint of primary mktsvc service name"
  value       = module.ecs-private-cluster.vpc_endpoint_service_primary_mktsvc_service_name
}

output "VPC_SECONDARY_SERVICE_NAME" {
  description = "vpc endpoint of secondary mktsvc service name"
  value       = module.ecs-private-cluster.vpc_endpoint_service_secondary_mktsvc_service_name
}

output "nlb_address" {
  description = "nlb address"
  value       = module.ecs-private-cluster.nlb_address
}