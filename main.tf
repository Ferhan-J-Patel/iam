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

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
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


