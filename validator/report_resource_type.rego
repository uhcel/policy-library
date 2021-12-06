# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package templates.gcp.GCPReportResourceTypeV1

import data.validator.gcp.lib as lib

deny[{
	"msg": message,
	"details": metadata,
}] {
	asset := input.asset
	ancestry_path = lib.get_default(asset, "ancestry_path", "")
	resource_data = asset.resource.data
	short_name = lib.get_default(resource_data, "name", "")
	display_name = lib.get_default(resource_data, "displayName", "")

	message := sprintf("%v", [asset.asset_type])
	metadata := {
		"asset_type": asset.asset_type,
		"name": asset.name,
		"ancestry_path": ancestry_path,
		"display_name": get_name(short_name, display_name),
	}
}

get_name(short_name, display_name) = output {
	display_name != ""
	output = display_name
}

get_name(short_name, display_name) = output {
	display_name == ""
	output = short_name
}