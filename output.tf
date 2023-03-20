output "iam" {
value = module.iam.*
sensitive = true
}
  
output "ac_id" {
  value = data.aws_caller_identity.current.account_id
}
