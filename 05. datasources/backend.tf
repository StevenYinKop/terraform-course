terraform {
  backend "s3" {
    region = "ap-southeast-2"
    bucket = "stevenyin-terraform-course-state-f21oq"
    key = "terraform/05-demo-datasources"
  }
}
