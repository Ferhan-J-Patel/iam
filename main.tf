module "iam"{
source = "./iam"
}

locals {
    secret_access_key_file = "E:/aws/access_key.txt"
}

resource "local_file" "secret_access_key" {
 content = join("",["Access Key ID: ", module.iam.access_key_id, "\n","Secret Access Key: ", module.iam.secret_access_key, "\n", module.iam.iam])
 filename = local.secret_access_key_file
}
