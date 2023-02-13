terraform {
  backend "s3" {
    bucket         = "webapp-s3-backend"
    key            = "webapp"
    region         = "eu-central-1"
    encrypt        = true
    role_arn       = "arn:aws:iam::683250049882:role/WebappS3BackendRole"
    dynamodb_table = "webapp-s3-backend"
  }
}