resource "aws_security_group" "rnd17-web" {
  name = "rnd17-web-${var.environment}"
  description = "Manage connections to the webservers"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${consul_keys.env.var.secure_cidr}","${consul_keys.env.var.mgmt_vpc_cidr}", "${var.cr_lan_ip}", "${consul_keys.env.var.vpc_cidr}" ]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${consul_keys.env.var.secure_cidr}","${consul_keys.env.var.mgmt_vpc_cidr}", "${consul_keys.env.var.vpc_cidr}", "${var.cr_lan_ip}"]
  }
  ingress {
    from_port = 24007
    to_port = 24007
    protocol = "tcp"
    self = true
  }
  ingress {
    from_port = 49152
    to_port = 65535
    protocol = "tcp"
    self = true
  }
  ingress {
    from_port = 111
    to_port = 111
    protocol = "tcp"
    self = true
  }
  ingress {
    from_port = 8300
    to_port = 8301
    protocol = "tcp"
    cidr_blocks = ["${consul_keys.env.var.vpc_cidr}"]
  }
  ingress {
    from_port = 8300
    to_port = 8301
    protocol = "udp"
    cidr_blocks = ["${consul_keys.env.var.vpc_cidr}"]
  }
  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    self = true
  }
  ingress {
    from_port = 24009
    to_port = 24009
    protocol = "tcp"
    self = true
  }
  ingress {
    from_port = 24010
    to_port = 24010
    protocol = "tcp"
    self = true
  }
  ingress {
    from_port = 38465
    to_port = 38465
    protocol = "tcp"
    self = true
  }
  ingress {
    from_port = 38466
    to_port = 38466
    protocol = "tcp"
    self = true
  }
  ingress {
    from_port = 111
    to_port = 111
    protocol = "udp"
    self = true
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  vpc_id = "${consul_keys.env.var.vpc_id}"
  tags {
    Env = "${var.environment}"
    Class = "securitygroup"
  }

}