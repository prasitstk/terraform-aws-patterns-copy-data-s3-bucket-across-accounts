output "tgt_temp_user_access_key_id" {
  value = aws_iam_access_key.temp_user_access_key.id
}

output "tgt_temp_user_access_key_secret" {
  value = aws_iam_access_key.temp_user_access_key.secret
  sensitive = true
}

output "tgt_s3_migration_role_arn" {
  value = aws_iam_role.s3_migration_role.arn
}

output "src_aws_region" {
  value = var.src_aws_region
}

output "src_s3_bucket_name" {
  value = data.aws_s3_bucket.src_s3_bucket.id
}

output "tgt_aws_region" {
  value = var.tgt_aws_region
}

output "tgt_s3_bucket_name" {
  value = data.aws_s3_bucket.tgt_s3_bucket.id
}
