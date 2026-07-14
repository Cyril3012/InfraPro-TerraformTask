output "control_public_ip" {

  value = aws_instance.control.public_ip
}

output "managed_public_ip" {

  value = aws_instance.managed.public_ip
}

output "control_private_ip" {

  value = aws_instance.control.private_ip
}

output "managed_private_ip" {

  value = aws_instance.managed.private_ip
}