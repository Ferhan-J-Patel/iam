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

output "access_key_id" {
  value = aws_iam_access_key.example.id
}

output "secret_access_key" {
  value = aws_iam_access_key.example.secret
}

output "account_id" {
  value = aws_iam_user.newuser.unique_id
}


locals {
  secret_access_key_file = "/path/to/secret/access_key.txt"}

resource "local_file" "secret_access_key" {
  content  = join("", [
    "Access Key ID: ", output.access_key_id, "\n",
    "Secret Access Key: ", output.secret_access_key, "\n",
    "account_id: ", output.account_id
  ])
  filename = local.secret_access_key_file
}
