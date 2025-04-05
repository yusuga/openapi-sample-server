import Dependencies
import OpenAPIURLSession

extension DependencyValues {

  var urlSessionTransport: URLSessionTransport {
    get { self[URLSessionTransportKey.self] }
    set { self[URLSessionTransportKey.self] = newValue }
  }

  private enum URLSessionTransportKey: DependencyKey {
    static var liveValue: URLSessionTransport {
      .init()
    }
  }
}
