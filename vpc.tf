resource "aws_vpc" "myvpc" {
	cidr_block = "10.0.0.0/20"
	tags {
	 Name = "myvpc"
	}
}

resource "aws_subnet" "mysubnet" {
	vpc_id     = "${aws_vpc.myvpc.id}"
	cidr_block = "10.0.1.0/24"
	map_public_ip_on_launch = "True"
	availability_zone = "us-east-1a"
	tags {
	 Name      = "Public_subnet"
   }

}

resource "aws_subnet" "myprivate" {
	vpc_id     = "${aws_vpc.myvpc.id}"
	cidr_block = "10.0.2.0/24"
	availability_zone = "us-east-1a"
	tags {
	     Name  = "Private_subnet "
	}
}

resource "aws_internet_gateway" "my_gateway" {
	vpc_id = "${aws_vpc.myvpc.id}"
	tags {
	 Name = "my_igw"
	}
}

resource "aws_route_table" "myroute" {
	vpc_id = "${aws_vpc.myvpc.id}"
	route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.my_gateway.id}"
	}
	tags {
	 Name = "publicroute"
	}	
}


