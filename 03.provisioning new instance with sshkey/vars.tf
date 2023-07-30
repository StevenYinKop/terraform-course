variable "AMIs" {
  type = map(string)
  default = {
    cn-north-1 = ""
    ap-southeast-2 = "ami-0d02292614a3b0df1"
    us-east-1 = "ami-0261755bbcb8c4a84"
  }
}

variable "AWS_REGION" {

}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
