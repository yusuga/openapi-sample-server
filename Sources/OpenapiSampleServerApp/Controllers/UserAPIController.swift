import Dependencies
import HTTPBingoClient
import MyServiceUserAPIServer

struct UserAPIController: MyServiceUserAPIServer.APIProtocol {

  @Dependency(\.httpBingoClient) var httpBingoClient

  func getUser(
    _ input: MyServiceUserAPIServer.Operations.GetUser.Input
  ) async throws -> MyServiceUserAPIServer.Operations.GetUser.Output {
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
