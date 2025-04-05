import Dependencies
import MyServiceStoreAPIServer
import PostmanEchoClient

struct StoreAPIController: MyServiceStoreAPIServer.APIProtocol {


  @Dependency(\.postmanEchoClient) var postmanEchoClient

  func getStore(
    _ input: MyServiceStoreAPIServer.Operations.GetStore.Input
  ) async throws -> MyServiceStoreAPIServer.Operations.GetStore.Output {
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
