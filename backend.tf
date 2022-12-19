terraform {
  backend "s3" {
    bucket = "myremotesthreebucket"
    key    = "terraform/mytfstate.state"
    region = "us-east-1"
  }
}