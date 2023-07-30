terraform {
  backend "s3" {
    bucket = "stevenyin-terraform-course-state-f21oq"
    key = "terraform/04-demo-output-attributes"
  }
}
