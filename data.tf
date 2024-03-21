###############
# Datasources #
###############

#----------------#
# Source account #
#----------------#

data "aws_s3_bucket" "src_s3_bucket" {
  provider = aws.source
  bucket   = var.src_s3_bucket_name
}

#----------------#
# Target account #
#----------------#

data "aws_s3_bucket" "tgt_s3_bucket" {
  provider = aws.target
  bucket   = var.tgt_s3_bucket_name
}
