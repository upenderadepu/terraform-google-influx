# ------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# ------------------------------------------------------------------------------

# TF_VAR_license_key
# TF_VAR_shared_secret

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "region" {
  description = "All resources will be launched in this region."
}

variable "project" {
  description = "ID of the GCP Project where all resources will be launched."
}

variable "name_prefix" {
  description = "This variable is used to namespace all resources created by this module."
}

variable "influxdb_image" {
  description = "The source image used to create the boot disk for an InfluxDB nodes."
}

variable "kapacitor_image" {
  description = "The source image used to create the boot disk for an Kapacitor nodes."
}

variable "telegraf_image" {
  description = "The source image used to create the boot disk for an Telegraf nodes."
}

variable "chronograf_image" {
  description = "The source image used to create the boot disk for an Chronograf nodes."
}

variable "license_key" {
  description = "The key of your InfluxDB Enterprise license. This should not be set in plain-text and can be passed in as an env var or from a secrets management tool."
}

variable "shared_secret" {
  description = "A long pass phrase that will be used to sign tokens for intra-cluster communication on data nodes. This should not be set in plain-text and can be passed in as an env var or from a secrets management tool."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

# For the example, we recommend a /16 network for the VPC. Note that when changing the size of the network,
# you will have to adjust the 'cidr_subnetwork_width_delta' in the 'vpc_network' -module accordingly.
variable "vpc_cidr_block" {
  description = "The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27."
  default     = "10.3.0.0/16"
}

# For the example, we recommend a /16 network for the secondary range. Note that when changing the size of the network,
# you will have to adjust the 'cidr_subnetwork_width_delta' in the 'vpc_network' -module accordingly.
variable "vpc_secondary_cidr_block" {
  description = "The IP address range of the VPC's secondary address range in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27."
  default     = "10.4.0.0/16"
}

variable "machine_type" {
  description = "The machine type of the Compute Instance to run for each node in the solution (e.g. n1-standard-1)."
  default     = "n1-standard-1"
}