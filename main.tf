#################
# IAM resources #
#################

#----------------#
# Source account #
#----------------#

resource "aws_s3_bucket_policy" "app_bucket_policy" {
  provider = aws.source
  bucket   = data.aws_s3_bucket.src_s3_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "DelegateS3Access",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : aws_iam_role.s3_migration_role.arn
        },
        "Action" : [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:GetObjectTagging",
          "s3:GetObjectVersion",
          "s3:GetObjectVersionTagging"
        ],
        "Resource" : [
          "arn:aws:s3:::${data.aws_s3_bucket.src_s3_bucket.id}/*",
          "arn:aws:s3:::${data.aws_s3_bucket.src_s3_bucket.id}"
        ]
      }
    ]
  })
}

#----------------#
# Target account #
#----------------#

resource "aws_iam_user" "temp_user" {
  provider = aws.target
  name     = "temp-user"
  path     = "/"
}

resource "aws_iam_access_key" "temp_user_access_key" {
  provider = aws.target
  user     = aws_iam_user.temp_user.name
}

resource "aws_iam_policy" "s3_migration_policy" {
  provider = aws.target
  name     = "S3MigrationPolicy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:GetObjectTagging",
          "s3:GetObjectVersion",
          "s3:GetObjectVersionTagging"
        ],
        "Resource" : [
          "arn:aws:s3:::${data.aws_s3_bucket.src_s3_bucket.id}",
          "arn:aws:s3:::${data.aws_s3_bucket.src_s3_bucket.id}/*"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:ListBucket",
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:PutObjectTagging",
          "s3:GetObjectTagging",
          "s3:GetObjectVersion",
          "s3:GetObjectVersionTagging"
        ],
        "Resource" : [
          "arn:aws:s3:::${data.aws_s3_bucket.tgt_s3_bucket.id}",
          "arn:aws:s3:::${data.aws_s3_bucket.tgt_s3_bucket.id}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "s3_migration_role" {
  provider = aws.target
  name     = "S3MigrationRole"
  path     = "/"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Sid" : "AllowTempUserToAssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : aws_iam_user.temp_user.arn
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  managed_policy_arns = [
    aws_iam_policy.s3_migration_policy.arn
  ]
}
