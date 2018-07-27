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
    Name = "1111_${var.vm_name}"
  }
}

variable "vm_name" {
  description = "Name for VM to be created"
}