resource "aws_security_group" "default" {
  name = "sgswarmcluster"

  # Allow all inbound
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Enable ICMP
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "master" {
  ami                    = var.machine_image
  instance_type          = var.machine_type
  key_name               = var.key_name
  user_data              = file(var.bootstrap_path)
  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Name = "master"
  }
}

resource "aws_instance" "worker1" {
  ami                    = var.machine_image
  instance_type          = var.machine_type
  key_name               = var.key_name
  user_data              = file(var.bootstrap_path)
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  tags = {
    Name = "worker 1"
  }
}

resource "aws_instance" "worker2" {
  ami                    = var.machine_image
  instance_type          = var.machine_type
  key_name               = var.key_name
  user_data              = file(var.bootstrap_path)
  vpc_security_group_ids = [aws_security_group.default.id]

  tags = {
    Name = "worker 2"
  }
}


