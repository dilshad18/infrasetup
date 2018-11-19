
resource "template_file" "public-userdata" {
               filename = "user-data.pub"
}


resource "aws_instance" "public" {
  
     ami             = "ami-0ac019f4fcb7cb7e6"
     instance_type   = "t2.micro"
     subnet_id       = "${aws_subnet.public_subnet.id}"
     security_groups = ["${aws_security_group.security_group.id}"]     
     key_name        = "rootkey"
     user_data       = "${template_file.public-userdata.rendered}"
     tags {
         Name        = "public_box"
        }
	

}
	
resource "template_file" "private-userdata" {
               filename = "user-data.web"
}


resource "aws_instance" "private" {
	ami             = "ami-0ac019f4fcb7cb7e6"
	instance_type   = "t2.micro"
	subnet_id       = "${aws_subnet.private_subnet.id}"
	security_groups = ["${aws_security_group.security_group.id}"]
	user_data       = "${template_file.private-userdata.rendered}"
			
	tags {
	 Name           = "private_box"
	 }
	key_name        = "rootkey"
}



