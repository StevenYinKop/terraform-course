variable "myFirstVariable" {
  type = string
  default = "Hello Terraform!"
}
# var.myFirstVariable

variable "myMap" {
  type = map(string)
  default = {
    cn = "cn-north-1"
    us = "us-west-1"
    de = "eu-west-1"
    fr = "eu-west-1"
  }
}

variable "myList" {
  type = list
  default = [1,2,3,4,5]
}