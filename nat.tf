resource "aws_instance" "nat" {
     ami               = "ami-01623d7b"
     instance_type     = "t2.micro"
     subnet_id         = "${aws_subnet.public_subnet.id}"
     security_groups   = ["${aws_security_group.security_group.id}"]
     source_dest_check = "false"
     tags {
      Name             = "nat_box"
        }
     key_name          = "rootkey"
}


