// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "PokedexAPI",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "PokedexAPI", targets: ["PokedexAPI"]),
    .library(name: "PokeDexTests", targets: ["PokeDexTests"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios.git", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "PokedexAPI",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
    .target(
      name: "PokeDexTests",
      dependencies: [
        .product(name: "ApolloTestSupport", package: "apollo-ios"),
        .target(name: "PokedexAPI"),
      ],
      path: "./PokeDexTests"
    ),
  ]
)
