
output "VPC_PRIMARY_SERVICE_NAME" {
  description = "vpc endpoint of primary mktsvc service name"
  value       = module.ecs-private-cluster1.vpc_endpoint_service_mktsvc_service_name
}

output "VPC_SECONDARY_SERVICE_NAME" {
  description = "vpc endpoint of secondary mktsvc service name"
  value       = module.ecs-private-cluster2.vpc_endpoint_service_mktsvc_service_name
}

output "nlb_address1" {
  description = "nlb address 1"
  value       = module.ecs-private-cluster1.nlb_address
}

output "nlb_address2" {
  description = "nlb address 2"
  value       = module.ecs-private-cluster2.nlb_address
}