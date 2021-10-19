provider "aws" {
    region = "us-east-1"
}

module "modules" {
    source = "./modules"

    common_name = "hello-week7"
    instance_type = "t2.micro"
    instance_ami  = "ami-087c17d1fe0178315"

    desired_capacity = "2"
    max_size         = "4"
    min_size         = "1"
}