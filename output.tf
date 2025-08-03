output "load_balancer_dns" {
  value = aws_lb.alb.dns_name
}


output "bastion_public_ip" {
  value = aws_instance.bastion_host.public_ip
}