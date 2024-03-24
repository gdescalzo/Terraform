resource "aws_iam_user" "terraform_user" {
    name = "terraform"  
}

resource "aws_iam_access_key" "terraform_user_key" {
    user = aws_iam_user.terraform_user
}

output "secret_key" {
  value = aws_iam_access_key.terraform_user_key.secret
  sensitive = true
}

output "access_key" {
  value = aws_iam_access_key.terraform_user_key.id
  sensitive = true
}