output "private_ip" {
  description = "private_ip"
  value       = [module.emulator1.private_ip]
}


output "subnetids" {
  value = module.vpc.private_subnets
}

output "default_security_group_id" {
  value = module.vpc.default_security_group_id
}

output "nlb_address1" {
  value = module.ecs-private-cluster1.nlb_address
}

