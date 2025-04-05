import Dependencies
import PostmanEchoClient
import OpenAPIURLSession

extension DependencyValues {

  var postmanEchoClient: PostmanEchoClient.Client {
    get { self[PostmanEchoClientKey.self] }
    set { self[PostmanEchoClientKey.self] = newValue }
  }

  private enum PostmanEchoClientKey: DependencyKey {
    static var liveValue: PostmanEchoClient.Client {
      fatalError("Value of type \(Value.self) is not registered in this context")
    }
  }
}
