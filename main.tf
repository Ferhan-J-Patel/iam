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

resource "aws_iam_user_login_profile" "example" {
  user    = aws_iam_user.newuser.name  
}

output "password" {
  value = aws_iam_user_login_profile.example.encrypted_password
}
