# Output the VCN ID
output "vcn_id" {
  description = "The OCID of the VCN"
  value       = oci_core_virtual_network.my_vcn_abid_vm.id
}

# Output the public subnet ID
output "subnet_public_id" {
  description = "The OCID of the public subnet"
  value       = oci_core_subnet.subnet_public.id
}

# Output the private subnet ID
output "subnet_private_id" {
  description = "The OCID of the private subnet"
  value       = oci_core_subnet.subnet_private.id
}
