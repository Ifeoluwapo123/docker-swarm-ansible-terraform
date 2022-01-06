variable "aws_region" {
  type        = string
  description = "VPC Region"
  default     = "us-east-1"
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
}

variable "git_access_token" {
  type        = string
  description = "Github access token"
}

variable "github_repos" {
  type = list(string)
}

variable "user" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "machine_image" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "bootstrap_path" {
  description = "Script to install Docker Engine"
  default = "install-docker.sh"
}

variable "key_path" {
  description = "SSH Public Key path"
  default = "/Users/damilolaadenusi/Documents/mai-key.pem"
}

