/*                         
* AWS connection. 
*/


provider "aws" {
  region = "eu-central-1"
}
  
resource "aws_instance" "test_VM" {
  ami           = "ami-657bd20a"
  instance_type = "t2.micro"

  tags {
    Name = "${lookup(var.vm_names_map, var.vm_name)}"
  }
}

variable "vm_name" {
  description = "Name for VM to be created"
}

variable "vm_names_map" {
  type = "map"
  default = {
    development = "development_name"
    staging = "staging_name"
    production = "production_name"
  }
}