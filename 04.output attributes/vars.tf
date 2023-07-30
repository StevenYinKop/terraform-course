variable "AMIs" {
  type = map(string)
  default = {
    cn-north-1 = ""
    ap-southeast-2 = "ami-0d02292614a3b0df1"
    us-east-1 = "ami-0261755bbcb8c4a84"
  }
}

variable "AWS_REGION" {
  type = string
  default = "ap-southeast-2"
}
