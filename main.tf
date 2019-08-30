resource "ibm_is_vpc" "vpc2-tf" {
  name = "vpc2-tf"
}

resource "ibm_is_subnet" "vpc2-subnet1" {
  name            = "vpc2-subnet1"
  vpc             = "${ibm_is_vpc.vpc1.id}"
  zone            = "${var.zone1}"
  ipv4_cidr_block = "10.240.0.0/28"

  provisioner "local-exec" {
    command = "sleep 300"
    when    = "destroy"
  }
}




