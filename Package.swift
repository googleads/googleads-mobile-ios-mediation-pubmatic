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
  platforms: [.iOS(.v13)],
  products: [
    .library(
      name: "PubMaticAdapterTarget",
      targets: ["PubMaticAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/PubMatic/OpenWrapSDK-Swift-Package.git",
      exact: "5.1.0"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.3.0"
    ),
  ],
  targets: [
    .target(
      name: "PubMaticAdapterTarget",
      dependencies: [
        .target(name: "PubMaticAdapter"),
        .product(name: "OpenWrapSDK", package: "OpenWrapSDK-Swift-Package"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "PubMaticAdapterTarget"
    ),
    .binaryTarget(
      name: "PubMaticAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/PubMatic/PubMaticAdapter-5.1.0.1.zip",
      checksum: "66d405ca25d4abfc0e78739d9ffd5d7eafa692adae4b132ef70c56c75078395d"
    ),
  ]
)
