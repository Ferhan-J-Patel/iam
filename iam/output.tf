output "access_key_id" {
  value = aws_iam_access_key.example.id
  sensitive = true
}

output "secret_access_key" {
  value = aws_iam_access_key.example.secret
  sensitive = true
}

output "account_id" {
  value = aws_iam_user.newuser.unique_id
}
