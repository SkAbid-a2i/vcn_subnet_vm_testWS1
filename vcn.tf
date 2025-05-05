# Create the VCN
resource "oci_core_virtual_network" "my_vcn_abid_vm" {
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr
  display_name   = "MyVcnAbid(vm)"
  dns_label      = "myvcnabidvm"  # Updated DNS label
}

# Create Route Table for Public Subnet
resource "oci_core_route_table" "public_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name   = "Public Route Table"
}

# Create Route Table for Private Subnet
resource "oci_core_route_table" "private_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name   = "Private Route Table"
}

# Create Security List for Public Subnet
resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name   = "Public Security List"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    source      = "0.0.0.0/0"
    protocol    = "all"
    tcp_options {
      min = 80
      max = 80
    }
  }
}

# Create Security List for Private Subnet
resource "oci_core_security_list" "private_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name   = "Private Security List"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    source      = "10.0.0.0/24"
    protocol    = "all"
  }
}

# Create the Public Subnet
resource "oci_core_subnet" "subnet_public" {
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name        = "Public Subnet"
  cidr_block          = "10.0.0.0/24"
  availability_domain = "Uocm:PHX-AD-1"
  route_table_id      = oci_core_route_table.public_route_table.id
  security_list_ids   = [oci_core_security_list.public_security_list.id]
}

# Create the Private Subnet
resource "oci_core_subnet" "subnet_private" {
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name        = "Private Subnet"
  cidr_block          = "10.0.1.0/24"
  availability_domain = "Uocm:PHX-AD-1"
  route_table_id      = oci_core_route_table.private_route_table.id
  security_list_ids   = [oci_core_security_list.private_security_list.id]
}
