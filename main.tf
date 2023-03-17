provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "newuser" {
    name = "chetan"
}

resource "aws_iam_role_policy" "AmazonEC2FullAccess"
name = "AmazonEC2FullAccess"
role = "${aws_iam_role.test_role.id}"

  policy = "${file("ec2-policy.json")}"
 }

