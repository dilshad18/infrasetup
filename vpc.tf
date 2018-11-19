resource "aws_vpc" "vpc" {
	cidr_block = "172.20.0.0/16"
	tags {
	 Name      = "us_east1_vpc"
	}
}

resource "aws_subnet" "public_subnet" {
	vpc_id                  = "${aws_vpc.vpc.id}"
	cidr_block              = "172.20.10.0/24"
	map_public_ip_on_launch = "True"
	availability_zone       = "us-east-1a"
	tags {
	 Name                   = "public_subnet"
   }

}

resource "aws_subnet" "private_subnet" {
	vpc_id            = "${aws_vpc.vpc.id}"
	cidr_block        = "172.20.20.0/24"
	availability_zone = "us-east-1a"
	tags {
	     Name         = "private_subnet "
	}
}

resource "aws_internet_gateway" "vpc_gateway" {
	vpc_id    = "${aws_vpc.vpc.id}"
	tags {
	 Name     = "vpc_igw"
	}
}

resource "aws_route_table" "public_route" {
	vpc_id     = "${aws_vpc.vpc.id}"
	route {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.vpc_gateway.id}"
	}
	tags {
	 Name      = "public_route"
	}	
}


