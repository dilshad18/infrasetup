resource "aws_security_group" "mycustomgroup" {
	name = "mycustome"
	description = "allow all traffice"
	vpc_id = "${aws_vpc.myvpc.id}"

	ingress {
	from_port   = 0
	to_port     = 7000
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
	from_port = 0
	to_port   = 7000
	protocol  = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
	
	tags {
         Name = "mycustomsec"
	}
}
