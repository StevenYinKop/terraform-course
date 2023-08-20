output "region" {
  value = var.AWS_REGION
}

output "amis" {
  value = var.AMIs
}

output "instance_type" {
  value   = var.INSTANCE_TYPE
}

output "instance_device_name" {
  value = var.INSTANCE_DEVICE_NAME
}

output "public_key_file" {
  value = file("${path.module}/${var.PUBLIC_KEY_FILE}")
}

output "image_id" {
  value = var.AMIs[var.AWS_REGION]
}

output "environment" {
  value = var.ENVIRONMENT
}

output "rds_password" {
  value = var.RDS_PASSWORD
}
