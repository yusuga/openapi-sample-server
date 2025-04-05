import OpenAPIVapor
import Vapor

public func configure(_ app: Application) async throws {
  let middleware = [
    APIClientInjectionMiddleware()
  ]

  let transport = VaporTransport(
    routesBuilder: app.grouped(middleware)
  )

  try UserAPIController().registerHandlers(on: transport)
  try StoreAPIController().registerHandlers(on: transport)
}
