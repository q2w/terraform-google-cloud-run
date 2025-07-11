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

output "service_account_id" {
  description = "Service account id and email"
  value = {
    id     = google_service_account.webhook.account_id,
    email  = google_service_account.webhook.email,
    member = google_service_account.webhook.member
  }
}

output "function_name" {
  value = google_cloudfunctions2_function.webhook.name
}

output "location" {
  value = google_cloudfunctions2_function.webhook.location
}
