output "vcn_id" {
  value = oci_core_virtual_network.my_vcn_abid_vm.id
}

output "public_subnet_id" {
  value = oci_core_subnet.subnet_public.id
}

output "private_subnet_id" {
  value = oci_core_subnet.subnet_private.id
}
