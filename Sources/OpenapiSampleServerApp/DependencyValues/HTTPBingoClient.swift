import Dependencies
import HTTPBingoClient
import OpenAPIURLSession

extension DependencyValues {

  var httpBingoClient: HTTPBingoClient.Client {
    get { self[HTTPBingoClientKey.self] }
    set { self[HTTPBingoClientKey.self] = newValue }
  }

  private enum HTTPBingoClientKey: DependencyKey {
    static var liveValue: HTTPBingoClient.Client {
      fatalError("Value of type \(Value.self) is not registered in this context")
    }
  }
}
