# Resource: Bloco
# Local: Provider
# File: Tipo do provider
# Exemplo: Nome do recurso
resource "local_file" "exemplo" {
  #   content = "Hello Terraform"
  filename = "example.txt"
  content  = var.content
  #   filename = "example.txt"
}

variable "content" {
  type    = string
  default = "Hello Terraform 2"
}

output "file_id" {
  value = resource.local_file.exemplo.id
}

output "content" {
  value = resource.local_file.exemplo.content

}

output "chiken-egg" {
  value = sort(["🐣", "🥚"])

}
