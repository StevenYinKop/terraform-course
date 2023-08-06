resource "aws_key_pair" "keypair" {
  public_key = file("key/mykeypair.pub")
  key_name = "keypair"
}
