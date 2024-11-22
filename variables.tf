#Region
variable "region" {
  default = "ap-south-1"
}

#AMI Id
variable "ami_id" {
  default = "ami-0d13e3e640877b0b9"
}

#Instance Type
variable "instance_type" {
  default = "t2.micro"
}

#Key-Pair
variable "key-pair-name" {
  default = "terraform"
}

#Availability Zones
variable "availability-zone" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b"]

}

#Name of the EC2 Instance
variable "instance-name" {
  default = "web-server"

}

#Root Volume Size
variable "volume_size" {
  default = "8"

}

#Subnet
variable "subnet-id" {
  type    = list(string)
  default = ["subnet-698dbc01", "subnet-fdb1d7b1"]

}
