resource "aws_instance" "server1" {
  ami = var.ami
  instance_type = var.instance_type
  iam_instance_profile = var.iam_instance_profile_name
  user_data_base64 = base64encode(file("${path.module}/userdata.sh"))
  vpc_security_group_ids = [ var.sg_id ]
  subnet_id = var.sub1_id
}

resource "aws_instance" "server2" {
  ami = var.ami
  instance_type = var.instance_type
  iam_instance_profile = var.iam_instance_profile_name
  user_data_base64 = base64encode(file("${path.module}/userdata2.sh"))
  vpc_security_group_ids = [ var.sg_id ]
  subnet_id = var.sub2_id
}
