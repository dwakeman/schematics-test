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


resource "ibm_is_ssh_key" "sshkey" {
  name       = "ssh1"
  public_key = "${file(var.ssh_public_key)}"
}



resource "ibm_is_ipsec_policy" "example" {
  name                     = "test_ipsec"
  authentication_algorithm = "md5"
  encryption_algorithm     = "3des"
  pfs                      = "disabled"
}

resource "ibm_is_ike_policy" "example" {
  name                     = "test_ike"
  authentication_algorithm = "md5"
  encryption_algorithm     = "3des"
  dh_group                 = 2
  ike_version              = 1
}


