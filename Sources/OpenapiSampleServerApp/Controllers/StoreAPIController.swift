import Dependencies
import MyServiceStoreAPIServer
import PostmanEchoClient

struct StoreAPIController: MyServiceStoreAPIServer.APIProtocol {

  @Dependency(\.postmanEchoClient) var postmanEchoClient

  func getStoreGet(
    _ input: MyServiceStoreAPIServer.Operations.GetStoreGet.Input
  ) async throws -> MyServiceStoreAPIServer.Operations.GetStoreGet.Output {
    let result = try await postmanEchoClient.getGet()

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
