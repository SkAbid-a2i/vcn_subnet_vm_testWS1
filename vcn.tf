# VCN Resource with updated DNS label
resource "oci_core_virtual_network" "my_vcn_abid_vm" {
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr
  display_name   = "MyVCNAbid(vm)"
  dns_label      = "myvcnabidvm"  # Corrected DNS label (all lowercase, no parentheses)
}

# Public Subnet Resource
resource "oci_core_subnet" "subnet_public" {
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn_abid_vm.id
  cidr_block          = "10.0.0.0/24"
  display_name        = "Public Subnet"
  route_table_id      = oci_core_route_table.public_route_table.id
  security_list_ids   = [oci_core_security_list.public_security_list.id]
  availability_domain = "CtIH:ap-dcc-gazipur-1-ad-1"  # Corrected Availability Domain
}

# Private Subnet Resource
resource "oci_core_subnet" "subnet_private" {
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn_abid_vm.id
  cidr_block          = "10.0.1.0/24"
  display_name        = "Private Subnet"
  route_table_id      = oci_core_route_table.private_route_table.id
  security_list_ids   = [oci_core_security_list.private_security_list.id]
  availability_domain = "CtIH:ap-dcc-gazipur-1-ad-1"  # Corrected Availability Domain
}

# Route Tables
resource "oci_core_route_table" "private_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name   = "Private Route Table"
}

resource "oci_core_route_table" "public_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name   = "Public Route Table"
}

# Security Lists
resource "oci_core_security_list" "private_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name   = "Private Security List"
}

resource "oci_core_security_list" "public_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name   = "Public Security List"
}
