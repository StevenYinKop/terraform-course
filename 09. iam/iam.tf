resource "aws_iam_role" "s3_bucket_role" {
  name               = "s3_bucket_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "s3_bucket_role_instance_profile" {
  name = "s3_bucket_role_instance_profile"
  role = aws_iam_role.s3_bucket_role.name
}

resource "aws_iam_role_policy" "s3_bucket_role_policy" {
  name = "s3_bucket_role_policy"
  role = aws_iam_role.s3_bucket_role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::mybucket-c29df1",
              "arn:aws:s3:::mybucket-c29df1/*"
            ]
        }
    ]
}
EOF

}
