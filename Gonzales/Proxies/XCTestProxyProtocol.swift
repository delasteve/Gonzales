public protocol XCTestProxyProtocol {
  func fail(message: String, file: String, line: UInt)
}