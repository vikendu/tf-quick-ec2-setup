resource "aws_eip" "public-ip-tf" {
  count = var.instance_count
  instance = "${aws_instance.app_server[count.index].id}"
  vpc      = true
}

resource "aws_internet_gateway" "gateway-tf" {
  vpc_id = "${aws_vpc.vpc-tf.id}"
}

resource "aws_route_table" "route-table-tf" {
  vpc_id = "${aws_vpc.vpc-tf.id}"
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gateway-tf.id}"
  }
  
}

resource "aws_route_table_association" "subnet-association-tf" {
  subnet_id      = "${aws_subnet.subnet-tf.id}"
  route_table_id = "${aws_route_table.route-table-tf.id}"
}
