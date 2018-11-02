resource "aws_default_route_table" "private_subnet" {
        default_route_table_id = "${aws_vpc.vpc.default_route_table_id}"
        route {
        cidr_block             = "0.0.0.0/0"
        instance_id            = "${aws_instance.nat.id}"
        }
        tags {
         Name                  = "private_route"
	}
}
