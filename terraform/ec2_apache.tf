resource "aws_instance" "test_ec2" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  # Install Apache web server
  user_data = <<EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    service httpd start
  EOF

  # Assign a fixed Elastic IP
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.eip.id
  }

  # Add a security group that allows incoming traffic only from a specific IP address
  security_groups = [aws_security_group.allow_specific_ip.name]
}

resource "aws_network_interface" "eip" {
  private_ips = ["10.0.0.10"]
  subnet_id   = aws_subnet.main.id
  security_groups = [aws_security_group.allow_specific_ip.name]

  attachment {
    device_index = 0
    instance     = aws_instance.test_ec2.id
  }

  # Assign a fixed Elastic IP
  private_ip_address = "10.0.0.10"
}

resource "aws_security_group" "allow_specific_ip" {
  name        = "allow_specific_ip"
  description = "Allow incoming traffic only from a specific IP address"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["91.231.246.50/32"]
  }
}