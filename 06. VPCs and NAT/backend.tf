terraform {
  backend "s3" {
    #    region = var.AWS_REGION
    #  Initializing the backend...
    #│ Error: Variables not allowed
    #│   on backend.tf line 3, in terraform:
    #│    3:     region = var.AWS_REGION
    #│ Variables may not be used here.
    #    The reason for this limitation is that Terraform
    #    needs to configure the backend and initialize state
    #    before it can start evaluating variables and resources.
    #    So the backend block can't rely on variables being set already.
    region = "ap-southeast-2"
    bucket = "stevenyin-terraform-course-state-f21oq"
    key = "terraform/06-vpcs-and-nat"
  }
}
