resource "aws_route_table_association" "routeadd" {
        subnet_id = "${aws_subnet.mysubnet.id}"
        route_table_id = "${aws_route_table.myroute.id}"
        }

resource "aws_route_table_association" "routeprivate" {
	subnet_id = "${aws_subnet.myprivate.id}"
	route_table_id = "${aws_default_route_table.myprivate.id}"
	}

