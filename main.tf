provider "aws" {
    region = "ap-south-1"
}

module "iam"{
source = "./iam"
}

data "aws_caller_identity" "current" {}    
    
locals {
    secret_access_key_file = "E:/aws/access_key.txt"
}

resource "local_file" "secret_access_key" {
 content = join("",["Access Key ID: ", module.iam.access_key_id, "\n","Secret Access Key: ", module.iam.secret_access_key, "\n", module.iam.account_id,module.iam.password])
 filename = local.secret_access_key_file
}
