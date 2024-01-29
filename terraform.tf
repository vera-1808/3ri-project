provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

resource "aws_instance" "nginx_instance" {
  ami           = "ami-0c7217cdde317cfec"  # Specify the desired AMI ID
  instance_type = "t2.micro"  # Change the instance type if needed

  tags = {
    Name = "nginx-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt install -y epel-release
              sudo apt install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF
}

output "public_ip" {
  value = aws_instance.nginx_instance.public_ip
}
