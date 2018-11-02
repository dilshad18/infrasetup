resource "aws_default_route_table" "myprivate" {
        default_route_table_id = "${aws_vpc.myvpc.default_route_table_id}"
        route {
        cidr_block = "0.0.0.0/0"
        instance_id = "${aws_instance.mynat.id}"
        }
        tags {
         Name = "privateroute"
	}
}
