variable "tenancy_ocid" {
  description = "The OCID of the tenancy used to sign the request to OCI."
  type        = string
}

variable "user_ocid" {
  description = "The OCID of the user used to sign the request to OCI."
  type        = string
}

variable "fingerprint" {
  description = "The fingerprint of the user used to sign the request to OCI."
  type        = string
}

variable "private_key" {
  description = "The private key used to sign the request to OCI."
  type        = string
}

variable "region" {
  description = "The OCI region where resources will be created."
  type        = string
  default     = "ap-dcc-gazipur-1"
}

variable "compartment_ocid" {
  description = "The OCID of the compartment where the resources will be created."
  type        = string
}

variable "vcn_cidr" {
  description = "The CIDR block for the VCN."
  type        = string
  default     = "10.0.0.0/16"
}
