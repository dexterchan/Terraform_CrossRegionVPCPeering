output "vpc_endpoint_service_mktsvc_service_name" {
  description = "vpc endpoint of mktsvc service name"
  value       = aws_vpc_endpoint_service.mktsvc.service_name
}

output "nlb_address" {
  description = "nlb address"
  value       = aws_vpc_endpoint_service.mktsvc.service_name
}