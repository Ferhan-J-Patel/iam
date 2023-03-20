module "iam"{
source = "./iam"
}

locals {
    secret_access_key_file = "E:/aws/access_key.txt"
}

resource "local_file" "secret_access_key" {
  content = "Access Key ID: \n"
  content += module.iam.access_key_id
  content += "Secret Access Key: \n"
  content += module.iam.secret_access_key
  filename = local.secret_access_key_file
}
