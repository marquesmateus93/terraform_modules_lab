resource "aws_security_group" "http-week7" {
    name        = "http-week7"
    description = "Allow HTTP inbound traffic"
    vpc_id      = "${var.vpc_id}"

    ingress = [
    {
        description      = "HTTP from VPC"
        from_port        = "${local.http_port}"
        to_port          = "${local.http_port}"
        protocol         = "tcp"
        cidr_blocks      = "${local.vpc_ipvs4}"
        ipv6_cidr_blocks = null

        prefix_list_ids = null
        security_groups = null
        self = null
    }
  ]

  tags = {
    Name = "http-week7"
  }
}

resource "aws_security_group" "ssh-week7" {
    name        = "ssh-week7"
    description = "Allow SSH inbound traffic"
    vpc_id      = "${var.vpc_id}"

    ingress = [
    {
        description      = "SSH from VPC"
        from_port        = "${local.ssh_port}"
        to_port          = "${local.ssh_port}"
        protocol         = "tcp"
        cidr_blocks      = "${local.vpc_ipvs4}"
        ipv6_cidr_blocks = null

        prefix_list_ids = null
        security_groups = null
        self = null
    }
  ]

  tags = {
    Name = "ssh-week7"
  }
}

resource "aws_security_group" "icmp-week7" {
    name        = "icmp-week7"
    description = "Allow ICMP inbound traffic"
    vpc_id      = "${var.vpc_id}"

    ingress = [
    {
        description      = "ICMP from VPC"
        from_port        = -1
        to_port          = -1
        protocol         = "all"
        cidr_blocks      = "${local.vpc_ipvs4}"
        ipv6_cidr_blocks = null

        prefix_list_ids = null
        security_groups = null
        self = null
    }
  ]

    egress = [
    {
        description      = "ICMP from VPC"
        from_port        = -1
        to_port          = -1
        protocol         = "all"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = null

        prefix_list_ids = null
        security_groups = null
        self = null
    }
  ]

  tags = {
    Name = "icmp-week7"
  }
}