// swift-tools-version:5.6

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "PubMaticAdapter",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "PubMaticAdapterTarget",
      targets: ["PubMaticAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/PubMatic/OpenWrapSDK-Swift-Package.git",
      exact: "4.10.0"
    )
  ],
  targets: [
    .target(
      name: "PubMaticAdapterTarget",
      dependencies: [
        .target(name: "PubMaticAdapter"),
        .product(name: "OpenWrapSDK", package: "OpenWrapSDK-Swift-Package"),
      ],
      path: "PubMaticAdapterTarget"
    ),
    .binaryTarget(
      name: "PubMaticAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/PubMatic/PubMaticAdapter-4.10.0.0.zip",
      checksum: "134cfd30b30010c0c569ab8ca6e67c56fddc99ebd90cf077ad6161b18115522d"
    ),
  ]
)
