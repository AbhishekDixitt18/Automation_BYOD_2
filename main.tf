# Latest Amazon Linux 2 AMI lookup
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_server_sg.id]
  key_name               = aws_key_pair.deployer_key.key_name

  associate_public_ip_address = true

  # user_data to install nginx, enable & overwrite default page
  user_data = <<-EOF
              #!/bin/bash
              set -e

              # Update and install nginx
              yum update -y
              amazon-linux-extras install -y nginx1
              systemctl enable nginx
              systemctl start nginx

              # Overwrite default index.html
              cat <<HTML > /usr/share/nginx/html/index.html
              <html>
                <head><title>Project Genesis</title></head>
                <body>
                  <h1>Project Genesis SUCCESS! Deployed by ${var.owner}</h1>
                </body>
              </html>
              HTML

              # ensure permissions
              chown root:root /usr/share/nginx/html/index.html
              chmod 644 /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name  = "web-server-abhishek-dixit"
    Owner = var.owner
  }
}
