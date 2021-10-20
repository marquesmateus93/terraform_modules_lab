provider "aws" {
    region = "us-east-1"
}

module "modules" {
    source = "./modules"

    common_name     = "hello-week7"
    instance_type   = "t2.micro"
    instance_ami    = "ami-087c17d1fe0178315"

    desired_capacity = "2"
    max_size         = "4"
    min_size         = "1"

    vpc_subnets_ids = [local.AZ-1B, local.AZ-1C, local.AZ-1D]
    vpc_ips         = ["172.16.0.0/12", "15.0.0.0/9", "192.56.0.0/16"]
}