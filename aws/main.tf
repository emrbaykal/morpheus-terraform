
provider "aws" {
  region = "us-west-2"
}

resource "aws_iam_policy" "s3_csi_policy" {
  name        = "AmazonS3CSIPolicy"
  description = "IAM policy for S3 CSI driver"
  policy      = file("s3-csi-policy.json")
}

resource "aws_iam_role" "s3_csi_role" {
  name               = "AmazonS3CSIRole"
  assume_role_policy = file("trust-policy.json")
}

resource "aws_iam_role_policy_attachment" "s3_csi_policy_attachment" {
  role       = aws_iam_role.s3_csi_role.name
  policy_arn = aws_iam_policy.s3_csi_policy.arn
}

output "role_arn" {
  value = aws_iam_role.s3_csi_role.arn
}
