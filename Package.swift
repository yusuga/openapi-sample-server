// swift-tools-version:6.0
import PackageDescription

let package = Package(
  name: "OpenapiSampleServerApp",
  platforms: [
    .macOS(.v13)
  ],
  dependencies: [
    // 💧 A server-side Swift web framework.
    .package(url: "https://github.com/vapor/vapor.git", from: "4.110.1"),

    // 🔵 Non-blocking, event-driven networking for Swift. Used for custom executors
    .package(url: "https://github.com/apple/swift-nio.git", from: "2.65.0"),

    // DI
    .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.6.0"),

    // OpenAPI
    .package(url: "https://github.com/swift-server/swift-openapi-vapor", from: "1.0.1"),
    .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),

    // MyService
    .package(url: "https://github.com/yusuga/openapi-sample-spec.git", revision: "39134747de92dc33b1293979ecbb4e5cec1963f4"),
  ],
  targets: [
    .executableTarget(
      name: "OpenapiSampleServerApp",
      dependencies: [
        // Vapor
        .product(name: "Vapor", package: "vapor"),
        .product(name: "NIOCore", package: "swift-nio"),
        .product(name: "NIOPosix", package: "swift-nio"),

        // DI
        .product(name: "Dependencies", package: "swift-dependencies"),

        // OpenAPI
        .product(name: "OpenAPIVapor", package: "swift-openapi-vapor"),

        // Client Transport
        .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),

        // MyService
        .product(name: "HTTPBingoClient", package: "openapi-sample-spec"),
        .product(name: "PostmanEchoClient", package: "openapi-sample-spec"),
        .product(name: "MyServiceAPIServer", package: "openapi-sample-spec"),
      ]
    ),
    .testTarget(
      name: "OpenapiSampleServerAppTests",
      dependencies: [
        .target(name: "OpenapiSampleServerApp"),
        .product(name: "VaporTesting", package: "vapor"),
      ]
    )
  ]
)
