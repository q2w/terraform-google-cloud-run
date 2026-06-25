/**
 * Copyright 2021 Google LLC
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
  cmek_template_annotation = var.encryption_key != null ? { "run.googleapis.com/encryption-key" = var.encryption_key } : {}
  template_annotations     = merge(var.template_annotations, local.cmek_template_annotation)
}

module test_module {
  source = "./modules/dummy-module"
  project_id = var.project_id
  location = var.location
  service_name = var.service_name
}