resource "aws_instance" "control" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  key_name = aws_key_pair.key.key_name

  vpc_security_group_ids = [

    aws_security_group.ansible.id
  ]

  associate_public_ip_address = true

  user_data = file("userdata.sh")

  tags = {

    Name = "Ansible-Control"
  }
}

resource "aws_instance" "managed" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public.id

  key_name = aws_key_pair.key.key_name

  vpc_security_group_ids = [

    aws_security_group.ansible.id
  ]

  associate_public_ip_address = true

  tags = {

    Name = "Managed-Node"
  }
}