# Resource: Bloco
# Local: Provider
# File: Tipo do provider
# Exemplo: Nome do recurso
resource "local_file" "exemplo" {
  content = "Hello Terraform"
  filename = "example.txt"
}