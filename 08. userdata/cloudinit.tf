#data "template_file" "shell-script" {
#  template = file()
#  vars = {
#    DEVICE = var.INSTANCE_DEVICE_NAME
#  }
#}

data "template_cloudinit_config" "cloudinit-example" {
  gzip = false
  base64_encode = false

  part {
    filename = "init.cfg"
    content_type = "text/cloud-config"
    content = templatefile("scripts/init.cfg", {})
  }
  part {
    content_type = "text/x-shellscript"
    content = templatefile("scripts/volumes.sh", {
      DEVICE = var.INSTANCE_DEVICE_NAME
    })
  }
}
