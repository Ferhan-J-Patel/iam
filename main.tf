provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "newuser" {
    name = "chetan"
}

resource "aws_tam_access_key" "chetan_user_access_key" {
  user = aws_tam_user.chetan_user.name
}
data "aws_tam_policy_document" "ec2_policy" {
  statement {
    effect = "Allow"
    actions = ["ec2:*"]
    resources = ["*"]
  }
}
resource "aws_tam_policy" "ec2_policy" {
  name = "ec2-policy"
  policy = data.aws_iam_policy_document.ec2_policy.json
}
resource "aws_iam_user_policy_attachment" "chetan_user_attachment" {
  policy_arn = aws_iam_policy.ec2_policy.arn
  user = aws_iam_user.chetan_user.name
}
