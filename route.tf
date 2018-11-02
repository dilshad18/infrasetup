resource "aws_route_table_association" "routepublic" {
        subnet_id      = "${aws_subnet.public_subnet.id}"
        route_table_id = "${aws_route_table.public_route.id}"
        }

resource "aws_route_table_association" "routeprivate" {
	subnet_id      = "${aws_subnet.private_subnet.id}"
	route_table_id = "${aws_default_route_table.private_subnet.id}"
	}

