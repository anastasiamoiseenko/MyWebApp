terraform {
  backend "s3" {
    bucket         = "webapp-s3-backend"
    key            = "webapp"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "webapp-s3-backend"
  }
}