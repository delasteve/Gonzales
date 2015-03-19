public class BaseMatcher {
  internal let xctestProxy: XCTestProxyProtocol

  internal init(xctestProxy: XCTestProxyProtocol = XCTestProxy()) {
    self.xctestProxy = xctestProxy
  }

  internal func fail(message: String, file: String, line: UInt) {
    xctestProxy.fail(message, file: file, line: line)
  }

  internal func buildMessage(beginning: String, end: String, negate: Bool) -> String {
    let seperator = " "

    if negate {
      return seperator.join([beginning, "not", end])
    } else {
      return seperator.join([beginning, end])
    }
  }
}
