output "private_ip" {
  description = "private_ip"
  value       = [module.emulator1.private_ip, module.emulator2.private_ip]
}
