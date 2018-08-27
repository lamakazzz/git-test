/*                         
* AWS connection. 
*/


provider "aws" {
  region = "${var.region_map}"
}
  
resource "aws_instance" "test_VM" {
  ami           = "ami-657bd20a"
  instance_type = "t2.micro"

  tags {
    Name = "${var.vm_name}"
  }
}

/*variable "vm_name" {
  description = "Name for VM to be created"
}*/

variable "region_map" {
  europe_center = "eu-central-1"
  europe_west = "eu-west-1"
}