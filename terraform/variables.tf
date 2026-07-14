variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "ansible-key"
}

variable "public_key_path" {
  default = "C:/Users/YOUR_USERNAME/.ssh/id_ed25519.pub"
}