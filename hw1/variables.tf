variable "vpc_id" {
    description = "The ID of VPC to be used to launch env"
}

variable "ami_id" {
    description = "The AMI to launche instances from"
} 

variable "name_prefix" {
    default     = "task1"
    description = "The prefix name of env to be launched"
}

variable "instance_type" {
    description = "The type of instances to be launched"
}

variable "key_name" {
    description = "The name of key to be used for SSH"  
}

variable "public_subnet_ids" {
    description = "The list of subnet ids to be used"
    type = "list"
}

variable "allowed_cidrs" {
    description = "The list of allowed CIDR blockes to access instances"
    type = "list"
}

variable "availability_zones" {
    description = "The list of availability zones to launch instances"
    type = "list"
}

variable "asg_min_size" {
    default = 1
    description = "Minimum size of auto scaling group"
}

variable "asg_max_size" {
    default = 3
    description = "Maximum size of auto scaling group"
}

variable "asg_desired_capacity" {
    default = 1
    description = "Desired capacity of auto scaling group"
}