resource "aws_instance" "Public-ec2-1" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type
  subnet_id     = var.subnet_public_1_id

  # Security group assign to instance
  vpc_security_group_ids = [var.elb_sg_id]

  key_name = var.key_name

  user_data = <<EOF
		#! /bin/bash
                sudo yum update -y
		sudo yum install -y httpd.x86_64
		sudo service httpd start
		sudo service httpd enable
    my_ip=$(curl http://checkip.amazonaws.com)
		echo "<h1>Deployed ELB Instance IP - $my_ip </h1>" | sudo tee /var/www/html/index.html
	EOF

  tags = {
    Name = "EC2-Instance-1"
  }
}

resource "aws_instance" "Public-ec2-2" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type
  subnet_id     = var.subnet_public_2_id

  vpc_security_group_ids = [var.elb_sg_id]

  key_name = var.key_name

  user_data = <<EOF
		#! /bin/bash
                sudo yum update -y
		sudo yum install -y httpd.x86_64
		sudo service httpd start
		sudo service httpd enable
		my_ip=$(curl http://checkip.amazonaws.com)
		echo "<h1>Deployed ELB Instance IP - $my_ip </h1>" | sudo tee /var/www/html/index.html
	EOF

  tags = {
    Name = "EC2-Instance-2"
  }
}