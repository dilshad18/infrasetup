resource "aws_security_group" "security_group" {
	name        = "common security group for all instances"
	description = "allow all traffice"
	vpc_id      = "${aws_vpc.vpc.id}"

	ingress {
	from_port   = 0
	to_port     = 9000
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
	from_port = 0
	to_port   = 9000
	protocol  = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
	
	tags {
         Name = "common_security_group"
	}
}
