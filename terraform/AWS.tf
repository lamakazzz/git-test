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
    Name = "8675675 ${var.vm_name}"
    test1 = "test tag auto12-kjhkj"
  }
}

variable "vm_name" {
  description = "Name for VM to be created"
}