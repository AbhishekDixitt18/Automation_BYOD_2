variable "region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_public_key_path" {
  description = "Path to local SSH public key file to upload (e.g. ~/.ssh/id_rsa.pub)"
  type        = string
  default     = "C:/Users/Asus/.ssh/id_ed25519.pub"
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed for SSH access (set to your IP e.g. 203.0.113.4/32 or 0.0.0.0/0 for exam)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "owner" {
  description = "Owner/name to use in tags and HTML"
  type        = string
  default     = "Abhishek Dixit"
}
