output "vpc_id" {
  value = aws_vpc.VPC.id
}

output "subnet_public_1_id" {
  value = aws_subnet.public_1.id
}

output "subnet_public_2_id" {
  value = aws_subnet.public_2.id
}

