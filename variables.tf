variable "src_aws_region" {
  type        = string
  description = "AWS Region of your source AWS account"
}

variable "src_aws_access_key" {
  type        = string
  description = "AWS Access Key of your source AWS account"
}

variable "src_aws_secret_key" {
  type        = string
  description = "AWS Secret Key of your source AWS account"
}

variable "src_s3_bucket_name" {
  type        = string
  description = "S3 bucket name of your source AWS account"
}

variable "tgt_aws_region" {
  type        = string
  description = "AWS Region of your target AWS account"
}

variable "tgt_aws_access_key" {
  type        = string
  description = "AWS Access Key of your target AWS account"
}

variable "tgt_aws_secret_key" {
  type        = string
  description = "AWS Secret Key of your target AWS account"
}

variable "tgt_s3_bucket_name" {
  type        = string
  description = "S3 bucket name of your target AWS account"
}
