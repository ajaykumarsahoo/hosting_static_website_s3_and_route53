resource "aws_s3_bucket" "terraform-static-website-aj" {
  bucket = var.bucketName
}

resource "aws_s3_bucket_website_configuration" "example-config" {
  bucket = aws_s3_bucket.terraform-static-website-aj.bucket
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

#Versisoning Enable:
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform-static-website-aj.id
  versioning_configuration {
    status = "Enabled"
  }
}
#S3 bucket public access
resource "aws_s3_bucket_acl" "state-bucket-acl" {
  bucket = aws_s3_bucket.terraform-static-website-aj.id
  acl    = "public-read"
}

#upload html files to s3 bucket
resource "aws_s3_object" "terraform-s3-object-index" {
  bucket = aws_s3_bucket.terraform-static-website-aj.id
  key    = "index.html"
  source = "../../html/index.html"
  acl    = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "terraform-s3-object-error" {
  bucket = aws_s3_bucket.terraform-static-website-aj.id
  key    = "error.html"
  source = "../../html/error.html"
  acl    = "public-read"
  content_type = "text/html"
}


#Resource to add bucket policy to a bucket 
resource "aws_s3_bucket_policy" "public_read_access" {
  bucket = aws_s3_bucket.terraform-static-website-aj.id
  policy = data.aws_iam_policy_document.public_read_access.json
}

#DataSource to generate a policy document
data "aws_iam_policy_document" "public_read_access" {
  statement {
    principals {
	  type = "*"
	  identifiers = ["*"]
	}

    actions = [
      "s3:GetObject",
    ]

    resources = [
      aws_s3_bucket.terraform-static-website-aj.arn,
      "${aws_s3_bucket.terraform-static-website-aj.arn}/*",
    ]
  }
}