variable "common_name" {
    type = string
    default = "hello-default"
    description = "Common cluster resources prefix."
}

variable "instance_type" {
    type = string
    default = "t2.micro"
    description = "Default VMs type."
}

variable "instance_ami" {
    type = string
    default = "ami-087c17d1fe0178315"
    description = "Default base VMs image."
}

variable "desired_capacity" {
    type = string
    default = "2"
    description = "How many VMs the cluster should have."
}

variable "max_size" {
    type = string
    default = "4"
    description = "The maximum number of VMs on cluster"
}

variable "min_size" {
    type = string
    default = "1"
    description = "The minimum number of VMs on cluster"
}

variable "vpc_id" {
    type = string
    default = "vpc-f7138f91"
    description = "HPID-DEV VPC ID."
}

variable "vpc_subnets_ids" {
    type = list(string)
    default = ["subnet-04585159", "subnet-7e608119", "subnet-39cdc516", "subnet-5175a71b"]
    description = "Subnets names."
}

variable "vpc_ips" {
    type = list(string)
    default = ["172.16.0.0/12", "15.0.0.0/9", "192.56.0.0/16"]
    description = "Subnets and VPN IP ranges."
}