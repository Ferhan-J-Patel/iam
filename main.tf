provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "newuser" {
    name = "chetan"
}

resource "aws_iam_policy" "policy" {
  name        = "AmazonEC2FullAccess"
  description = "A ec2 policy"
  policy      = "${file("ec2fullaccess.json")}"
}

resource "aws_iam_user_policy_attachment" "demo-attach"{
    user = "${aws_iam_user.newuser.name}"
    policy_arn = "${aws_iam_policy.policy.arn}"
}


resource "aws_iam_access_key" "example" {
  user = aws_iam_user.newuser.name
}

locals {
    secret_access_key_file = "E:/aws/access_key.txt"
}

resource "local_file" "secret_access_key" {
  content = join("Access Key ID: ",access_key_id.output.value,"\n","Secret Access Key: ",secret_access_key.output.value,"\n")
  filename = local.secret_access_key_file
}







