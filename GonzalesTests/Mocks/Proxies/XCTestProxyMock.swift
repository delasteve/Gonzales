import Gonzales

public class XCTestProxyMock: XCTestProxyProtocol {
  public var failWasCalled: Bool
  public var failFile: String
  public var failLine: UInt
  public var failMessage: String

  public init() {
    failMessage = ""
    failFile = __FILE__
    failLine = 0
    failWasCalled = false
  }

  public func fail(message: String, file: String, line: UInt) {
    failWasCalled = true
    failFile = file
    failLine = line
    failMessage = message
  }
}