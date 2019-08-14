# Generate layers from scripts directory
resource "null_resource" "generate_liquibase_layer" {
  triggers {
    build_number = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "scripts/make_liquibase_layer.sh lambdas/"
  }
}
resource "null_resource" "generate_aws_layer" {
  triggers {
    build_number = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "scripts/make_aws_layer.sh lambdas/"
  }
}
resource "null_resource" "generate_py_libs" {
  triggers {
    build_number = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "scripts/get_psycopg2.sh"
  }
}