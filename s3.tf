resource "aws_s3_bucket" "basds" {
    bucket = "my-tf-bucket-parvizm"
}


tags = {
    Name        = "MY Bucket"
    Environment = "dev"
}
