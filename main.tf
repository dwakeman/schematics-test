variable "vpc_name" {}
variable "resource_group" {
    default = "default"
}

variable "environment" {
    default = "sandbox"
}

resource "ibm_is_vpc" "vpc1" {
  name = "${var.vpc_name}"
  resource_group  = "${var.resource_group}"
  tags = ["${var.environment}", "terraform"]
}

resource "ibm_is_subnet" "subnet1" {
  name            = "${var.vpc_name}-subnet1"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone1}"
  ipv4_cidr_block = "10.240.0.0/28"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

resource "ibm_is_subnet" "subnet2" {
  name            = "${var.vpc_name}-subnet2"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone2}"
  ipv4_cidr_block = "10.240.64.0/28"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

resource "ibm_is_subnet" "subnet3" {
  name            = "${var.vpc_name}-subnet3"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone3}"
  ipv4_cidr_block = "10.240.128.0/18"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

