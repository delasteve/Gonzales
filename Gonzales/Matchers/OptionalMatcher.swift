public class OptionalMatcher: BaseMatcher  {
  private var xctestProxy: XCTestProxyProtocol

  public init(xctestProxy: XCTestProxyProtocol = XCTestProxy()) {
    self.xctestProxy = xctestProxy
  }

  public func exist(actual: AnyObject?, file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual == nil

    if comparison {
      var message = buildMessage("Expected <\(actual)> to", "be <nil>", negate: true)

      xctestProxy.fail(message, file: file, line: line)
    }
  }
}
