module "role-based-access" {
  source  = "../../"
  app_name = var.app_name
  app_role = "EXP"
  pipeline_type = var.pipeline_type
  env_type = var.env_type
  tribe = var.tribe
}




