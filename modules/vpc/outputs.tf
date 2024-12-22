output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "sg_id" {
  value = aws_security_group.sg.id
}

output "sub1_id" {
  value = aws_subnet.mysub1.id
}

output "sub2_id" {
  value = aws_subnet.mysub2.id
}