variable "AMIs" {
  type = map(string)
  default = {
    cn-north-1     = ""
    ap-southeast-2 = "ami-0d02292614a3b0df1"
    us-east-1      = "ami-0261755bbcb8c4a84"
  }
}

variable "AWS_REGION" {
  type    = string
  default = "ap-southeast-2"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "PUBLIC_KEY_FILE" {
  default = "./keys/mykey.pub"
}

variable "ENVIRONMENT" {
  default = "test"
}

variable "RDS_PASSWORD" {
  default = ""
}
