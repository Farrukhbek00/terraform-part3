output "elb" {
  description = "The DNS name of the ELB"
  value       = aws_lb.elb.dns_name
}