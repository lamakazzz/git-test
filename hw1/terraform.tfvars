name_prefix = "task1"
key_name = "cdp"

instance_type = "t2.micro"
ami_id = "ami-08935252a36e25f85"
vpc_id = "vpc-25ae8043"

public_subnet_ids = ["subnet-7e325836"]
allowed_cidrs = ["89.162.139.0/27"]

availability_zones = ["eu-west-1a", "eu-west-1b"]

asg_min_size = 1
asg_max_size = 3
asg_desired_capacity = 3