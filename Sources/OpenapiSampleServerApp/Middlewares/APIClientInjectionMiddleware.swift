import Dependencies
import HTTPBingoClient
import PostmanEchoClient
import Vapor

struct APIClientInjectionMiddleware {

  @Dependency(\.urlSessionTransport) var urlSessionTransport
}

extension APIClientInjectionMiddleware: AsyncMiddleware {

  func respond(
    to request: Request,
    chainingTo responder: AsyncResponder
  ) async throws -> Response {
    let response = try await withDependencies {
      try $0.httpBingoClient = .init(
        serverURL: HTTPBingoClient.Servers.Server1.url(),
        transport: urlSessionTransport
      )
      try $0.postmanEchoClient = .init(
        serverURL: PostmanEchoClient.Servers.Server1.url(),
        transport: urlSessionTransport
      )
    } operation: {
      try await responder.respond(to: request)
    }

    return response
  }
}
