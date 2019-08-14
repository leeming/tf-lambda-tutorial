# SG for lambda to run in
resource "aws_security_group" "private_lambda" {
  name        = "Lambda SG"
  description = "Allow lambda outbound TLS+ Postgres only"
  vpc_id      = "..."

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
