# Cloud Run v2 Service

## Description

### tagline

Deploy a Cloud Run Service using v2 API

### detailed

This module was deploys a Cloud Run Service and assigns access to the members.

## Usage

Basic usage of this module is as follows:

```hcl
module "cloud_run_core" {
  source  = "GoogleCloudPlatform/cloud-run/google//modules/v2"
  version = "~> 0.11.0"

  project_id      = var.project_id
  service_name    = "hello-world"
  location        = "us-central1"
  containers      = [
    {
      container_image = "us-docker.pkg.dev/cloudrun/container/hello"
    }
  ]
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| build\_config | n/a | <pre>object({<br>    runtime     = string<br>    entry_point = string<br>    storage_source = object({<br>      bucket = string<br>      object = string<br>    })<br>  })</pre> | n/a | yes |
| location | n/a | `string` | n/a | yes |
| name | n/a | `string` | n/a | yes |
| project\_id | n/a | `string` | n/a | yes |
| service\_account\_project\_roles | n/a | `list(string)` | `[]` | no |
| service\_config | n/a | <pre>object({<br>    available_memory      = string<br>    environment_variables = map(string)<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| function\_name | n/a |
| location | n/a |
| service\_account\_id | Service account id and email |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
