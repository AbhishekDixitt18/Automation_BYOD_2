output "public_ip" {
  description = "Public IP of the web server"
  value       = aws_instance.web.public_ip
}

output "web_url" {
  description = "HTTP URL of the web server"
  value       = "http://${aws_instance.web.public_ip}"
}
