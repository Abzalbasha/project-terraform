variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_session_token" {}
variable "region" {
    type = string
    description = "aws region where VM will be provisioned"
    default = "us-east-1"
}
