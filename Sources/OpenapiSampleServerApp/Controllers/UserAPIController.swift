import Dependencies
import HTTPBingoClient
import MyServiceUserAPIServer

struct UserAPIController: MyServiceUserAPIServer.APIProtocol {

  @Dependency(\.httpBingoClient) var httpBingoClient

  func getUserGet(
    _ input: MyServiceUserAPIServer.Operations.GetUserGet.Input
  ) async throws -> MyServiceUserAPIServer.Operations.GetUserGet.Output {
    let result = try await httpBingoClient.getGet()

    return try .ok(
      .init(
        body: .json(
          .init(
            name: result.ok.body.json.url
          )
        )
      )
    )
  }
}
