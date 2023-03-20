module "iam"{
source = "./iam"
}

locals {
    secret_access_key_file = "E:/aws/access_key.txt"
}

resource "local_file" "secret_access_key" {
  content = join("Access Key ID: ",module.access_key_id.output.value,"\n","Secret Access Key: ",module.secret_access_key.output.value,"\n")
  filename = local.secret_access_key_file
}