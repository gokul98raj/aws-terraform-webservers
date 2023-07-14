#Count of the EC2 Instances
variable "instance-count" {
  default = "2"

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
