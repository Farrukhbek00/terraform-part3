data "terraform_remote_state" "networking" {
    backend = "s3"
    config = {
        bucket = "farruh-tfstate-part2"
        key    = "networking_part3.tf"
        region = "eu-west-1"
    }
}