/*        
* AWS connection. 
*/

provider "aws" {
  region = "us-west-2"
}
  
resource "aws_instance" "test_VM" {
  ami           = "ami-efd0428f"
  instance_type = "t2.micro"

  tags {
    Name = "${var.vm_name}"
  }
}

variable "vm_name" {
  description = "Name for VM to be created"
}