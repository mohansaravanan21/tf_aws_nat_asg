resource "aws_instance" "bastion_host" {
  instance_type               = var.instance_type
  ami                         = var.ami_id
  subnet_id                   = aws_subnet.public_subnets[0].id
  security_groups             = [aws_security_group.sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  tags = {
    Name = "Bastion-Host"
  }
}
