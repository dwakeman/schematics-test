resource "ibm_is_vpc" "vpc1" {
  name = "vpc2-tf"
}

resource "ibm_is_subnet" "subnet1" {
  name            = "vpc2-subnet1"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone1}"
  ipv4_cidr_block = "10.240.0.0/28"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

resource "ibm_is_subnet" "subnet2" {
  name            = "vpc2-subnet2"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone2}"
  ipv4_cidr_block = "10.240.64.0/28"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

resource "ibm_is_subnet" "subnet3" {
  name            = "vpc2-subnet3"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone3}"
  ipv4_cidr_block = "10.240.128.0/18"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

