plugin "aws" {
  enabled = true
  version = "0.35.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

config {
  format = "compact"
  force  = false
}

rule "terraform_unused_declarations" {
  enabled  = true
  severity = "WARNING"
}
