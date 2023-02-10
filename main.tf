module "sg" {
  source = "./modules/sg"
  vpc_id = data.terraform_remote_state.networking.outputs.vpc_id
}

module "ec2" {
  source             = "./modules/ec2"
  region             = var.region
  vpc_id             = data.terraform_remote_state.networking.outputs.vpc_id
  subnet_public_1_id = data.terraform_remote_state.networking.outputs.subnet_public_1_id
  subnet_public_2_id = data.terraform_remote_state.networking.outputs.subnet_public_2_id
  elb_sg_id          = module.sg.elb_sg_id
}


