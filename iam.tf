# Users are added below
resource "aws_iam_user" "Tim" {
  name = "Tim"
  path = "/"
}

resource "aws_iam_user" "Ben" {
  name = "Ben"
  path = "/"
}

resource "aws_iam_user" "Lisa" {
  name = "Lisa"
  path = "/"
}

# adds groups
resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

resource "aws_iam_group" "admin" {
  name = "admin"
  path = "/"
}


# Group Memebership
resource "aws_iam_user_membership" "developers_team" {
  name = "developers-group-membership"
  users = [
    "${aws_iam_user.Tim.name}",
    "${aws_iam_user.Ben.name}",
    "${aws_iam_user.Lisa.name}",
  ]
  group = "${aws_iam_group.developers.name}"
}

#Policy
resource "aws_iam_policy" "policy" {
  name = "test_policy3"
  path = "/"
  description = "My test policy"
  policy = <<EOF
{ {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "NotAction": [
                "iam:*",
                "organizations:*",
                "account:*"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole",
                "iam:DeleteServiceLinkedRole",
                "iam:ListRoles",
EOF
}