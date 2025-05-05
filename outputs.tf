# Outputs for the resources created in vcn.tf
output "vcn_id" {
  value = oci_core_virtual_network.my_vcn_abid_vm.id
}

output "subnet_public_id" {
  value = oci_core_subnet.subnet_public.id
}

output "subnet_private_id" {
  value = oci_core_subnet.subnet_private.id
}

output "route_table_public_id" {
  value = oci_core_route_table.public_route_table.id
}

output "route_table_private_id" {
  value = oci_core_route_table.private_route_table.id
}

output "security_list_public_id" {
  value = oci_core_security_list.public_security_list.id
}

output "security_list_private_id" {
  value = oci_core_security_list.private_security_list.id
}
