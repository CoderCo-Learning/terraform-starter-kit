#!/usr/bin/env bash
set -e

cd "$(dirname "$0")/.."

echo "==> Terraform fmt (check)"
terraform fmt -check -recursive

echo "==> Terraform validate (examples)"
for dir in $(find examples -type f -name '*.tf' -exec dirname {} \; | sort -u); do
  echo "---- validating: $dir"
  (
    cd "$dir"
    terraform init -backend=false -input=false >/dev/null
    terraform validate
  )
done

echo "==> tflint"
tflint --init
tflint --recursive


echo "✅ Quality gate passed."
