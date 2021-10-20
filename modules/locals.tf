locals {
  ssh_port = 22
  http_port = 80
  allow_http = aws_security_group.http-week7.id
  allow_ssh = aws_security_group.ssh-week7.id
  allow_icmp = aws_security_group.icmp-week7.id
}