output "private_ip" {
  description = "private_ip"
  value       = aws_instance.emulator.private_ip
}
