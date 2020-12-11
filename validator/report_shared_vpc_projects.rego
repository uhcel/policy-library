# Copyright 2019 Google LLC
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

package templates.gcp.GCPReportSharedVPCHostProjectConstraintV1

import data.validator.gcp.lib as lib

deny[{
	"msg": message,
	"details": metadata,
}] {
	asset := input.asset

	asset.asset_type == "compute.googleapis.com/Project"
	asset.resource.data.xpnProjectStatus == "HOST"
	message := sprintf("%v", [asset.resource.data.name])
	ancestry_path = lib.get_default(asset, "ancestry_path", "")

	metadata := {"resource": asset.name, "ancestry_path": ancestry_path}
}