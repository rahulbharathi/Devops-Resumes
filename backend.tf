#need to run terraform init to apply this new backend configuration
terraform {
  backend "s3" {
    bucket = "@TF_STATE_BUCKET@" #name of the bucket in s3. expects the bucket to be present. error if not created beforehand.

    # bucket = "tfstate-rafa" #name of the bucket in s3. expects the bucket to be present. error if not created beforehand.

    key            = "cross-account-policy-tfstate.tfstate" #file path inside the bucket.
    region         = "us-west-2"
    encrypt        = "true"
    dynamodb_table = "tfstate_locks"                #name of the table in dynamodb with the primary key LockID. Expects the table to be present. error if not present.
    acl            = "bucket-owner-full-control"
    profile        = "@AWS_PROFILE@"                #"@AWS_PROFILE@"" "sys_rafa_devops_rafa_sbx"
  }
}
