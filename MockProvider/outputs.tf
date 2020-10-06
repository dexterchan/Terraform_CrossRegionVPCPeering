
output "vpc_endpoint_service_mktsvc_service_name" {
  description = "vpc endpoint of mktsvc service name"
  value       = module.ecs-private-cluster.vpc_endpoint_service_mktsvc_service_name
}

output "nlb_address" {
  description = "nlb address"
  value       = module.ecs-private-cluster.nlb_address
}