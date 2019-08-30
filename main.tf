resource "ibm_is_vpc" "vpc1" {
  name = "vpc1"
}

resource "ibm_is_subnet" "subnet1" {
  name            = "subnet1"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone1}"
  ipv4_cidr_block = "10.240.0.0/28"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}




