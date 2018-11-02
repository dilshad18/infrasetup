resource "aws_instance" "mynat" {
  ami = "ami-01623d7b"
     instance_type = "t2.micro"
     subnet_id = "${aws_subnet.mysubnet.id}"
     security_groups = ["${aws_security_group.mycustomgroup.id}"]
     source_dest_check = "false"
     tags {
      Name = "natmachine"
        }
     key_name = "rootkey"
}


