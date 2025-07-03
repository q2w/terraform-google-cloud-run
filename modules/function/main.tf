/**
 * Copyright 2025 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  webhook_sa_name = "${var.name}-sa"
}

resource "google_service_account" "webhook" {
  project    = var.project_id
  account_id = local.webhook_sa_name
}

resource "google_project_iam_member" "roles" {
  project = var.project_id
  role    = "roles/run.invoker"
  member  = google_service_account.webhook.member
}

resource "google_project_iam_member" "roles" {
  for_each = toset(var.service_account_project_roles)

  project = var.project_id
  role    = each.value
  member  = google_service_account.webhook.member
}

resource "google_cloudfunctions2_function" "webhook" {
  project  = var.project_id
  name     = var.name
  location = var.location

  build_config {
    runtime     = var.build_config.runtime
    entry_point = var.build_config.entry_point
    source {
      storage_source {
          bucket = var.build_config.storage_source.bucket
          object = var.build_config.storage_source.object
        }
    }
  }

  service_config {
    available_memory      = var.service_config.available_memory
    service_account_email = google_service_account.webhook.email
    environment_variables = var.service_config.environment_variables
  }
}