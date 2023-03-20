module "iam"{
source = "./iam"
}

locals {
    secret_access_key_file = "E:/aws/access_key.txt"
}

resource "local_file" "secret_access_key" {
 content = join("",["Access Key ID: ", output.access_key_id, "\n","Secret Access Key: ", output.secret_access_key, "\n"])
 filename = local.secret_access_key_file
}
