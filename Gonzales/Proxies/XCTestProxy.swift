import XCTest

public class XCTestProxy: XCTestProxyProtocol {

  public init() { }

  public func fail(message: String, file: String, line: UInt) {
    XCTFail(message, file: file, line: line)
  }
}
