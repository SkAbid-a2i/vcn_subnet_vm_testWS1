# Create the VCN
resource "oci_core_virtual_network" "my_vcn_abid_vm" {
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr
  display_name   = "MyVcnAbid(vm)"
  dns_label      = "myVcnAbid(vm)"
}

# Create a public subnet
resource "oci_core_subnet" "subnet_public" {
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name        = "Public Subnet"
  cidr_block          = "10.0.0.0/24"
  availability_domain = "Uocm:PHX-AD-1"  # Specify your availability domain
  route_table_id      = oci_core_route_table.default.id
  security_list_ids   = [oci_core_security_list.default.id]
}

# Create a private subnet
resource "oci_core_subnet" "subnet_private" {
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.my_vcn_abid_vm.id
  display_name        = "Private Subnet"
  cidr_block          = "10.0.1.0/24"
  availability_domain = "Uocm:PHX-AD-1"
  route_table_id      = oci_core_route_table.default.id
  security_list_ids   = [oci_core_security_list.default.id]
}
