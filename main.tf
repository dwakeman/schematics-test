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

  provisioner "local-exec" {
      command = <<EOF
ic api https://cloud.ibm.com;
ic resource groups
EOF
      when = "create"
  }
}

resource "ibm_is_subnet" "subnet1" {
  name            = "${var.vpc_name}-subnet1"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone1}"
  ipv4_cidr_block = "${var.cidr_block_1}"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

resource "ibm_is_subnet" "subnet2" {
  name            = "${var.vpc_name}-subnet2"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone2}"
  ipv4_cidr_block = "${var.cidr_block_2}"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

resource "ibm_is_subnet" "subnet3" {
  name            = "${var.vpc_name}-subnet3"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone3}"
  ipv4_cidr_block = "${var.cidr_block_3}"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}

