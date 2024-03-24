resource "aws_iam_user_policy" "terraform_user" {
  name = "Policy_Terraform_Admin"
  user = "" 
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF


}