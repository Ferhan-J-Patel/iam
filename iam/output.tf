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
  sensitive = true
}

output "password" {
  value     = aws_iam_user_login_profile.administrator.password
  sensitive = true
}
