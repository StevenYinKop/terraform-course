resource "aws_launch_configuration" "launch_configuration" {
  name_prefix     = "launch_configuration"
  image_id        = module.vars.image_id
  instance_type   = module.vars.instance_type
  key_name        = aws_key_pair.mykeypair.key_name
  security_groups = [aws_security_group.myinstance.id]
  user_data       = "#!/bin/bash\napt-get update\napt-get -y install net-tools nginx\nMYIP=`ifconfig | grep -E '(inet 10)|(addr:10)' | awk '{ print $2 }' | cut -d ':' -f2`\necho 'this is: '$MYIP > /var/www/html/index.html"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                      = "example-autoscaling"
  vpc_zone_identifier       = [for subnet in module.my_vpc.aws_vpc_subnet : lookup(subnet, "id")]
  launch_configuration      = aws_launch_configuration.launch_configuration.name
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.my-elb.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

resource "aws_key_pair" "mykeypair" {
  key_name   = "mykeypair"
  public_key = module.vars.public_key_file
}
