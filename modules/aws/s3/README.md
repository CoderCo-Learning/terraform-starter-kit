# S3 Module – V1.0.0

This module creates a production-ready Amazon S3 bucket for common storage use cases including applications, logs, backups, and static assets.

The bucket is private by default, with optional features such as versioning and server-side encryption configurable via module inputs.

## Features

- Private S3 bucket creation
- Optional bucket versioning
- Optional server-side encryption (SSE-S3 or SSE-KMS)
- Optional force deletion of bucket contents
- Reusable module design following AWS and Terraform best practices

## Requirements

| Name      | Version   |
|-----------|-----------|
| terraform | >= 1.11.0 |
| aws       | >= 6.24.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| `bucket_name` | Name of the S3 bucket | string | n/a | yes |
| `force_destroy` | Allow bucket deletion with objects inside | bool | `false` | no |
| `enable_versioning` | Enable S3 bucket versioning | bool | `false` | no |
| `enable_encryption` | Enable server-side encryption | bool | `false` | no |
| `kms_key_arn` | KMS key ARN for SSE-KMS encryption | string | `null` | no |

## Versioning (Optional)

S3 versioning allows you to preserve, retrieve, and restore every version of objects stored in the bucket.

- Disabled by default
- When enabled, object versions are retained on update or deletion

Enable with:

```hcl
enable_versioning = true
```

## Encryption (Optional)

Server-side encryption protects data at rest within the S3 bucket.

- Disabled by default
- Supports:
  - **SSE-S3 (AES256)** by default
  - **SSE-KMS** when a KMS key ARN is provided

Enable with:

```hcl
enable_encryption = true
```

## Example Usage

See full examples in the `examples/` directory.

## Outputs

| Name | Description |
|------|-------------|
| `bucket_id` | ID of the S3 bucket |
| `bucket_arn` | ARN of the S3 bucket |
| `bucket_name` | Name of the S3 bucket |

---

## Notes

- The S3 bucket is **private by default** and does not allow public access.
- Bucket versioning is **disabled by default** and must be explicitly enabled.
- Server-side encryption is **disabled by default**.
- When encryption is enabled:
  - **SSE-S3 (AES256)** is used by default.
  - **SSE-KMS** is used when a `kms_key_arn` is provided.
- Enabling `force_destroy` allows the bucket to be deleted even when objects exist.
- This module does not manage bucket policies unless explicitly configured.
- The module is suitable for application storage, logs, backups, and static assets.
- Designed to be reusable across environments (dev, staging, prod).

---

## Resources Created

This module may create the following AWS resources depending on configuration:

### Core
- `aws_s3_bucket` – S3 bucket

### Optional Versioning
- `aws_s3_bucket_versioning` – Bucket versioning configuration

### Optional Encryption
- `aws_s3_bucket_server_side_encryption_configuration` – Server-side encryption configuration