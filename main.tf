provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "newuser" {
    name = "chetan"
}

resource "aws_iam_policy" "AmazonEC2FullAccess" {
  name = "AmazonEC2FullAccess"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  user = aws_iam_user.chetan
}
