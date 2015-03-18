public class OptionalMatcher: BaseMatcher  {
  public override init(xctestProxy: XCTestProxyProtocol = XCTestProxy()) {
    super.init(xctestProxy: xctestProxy)
  }

  public func exist(actual: AnyObject?, file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual == nil

    if comparison {
      var message = buildMessage("Expected <\(actual)> to", end: "be <nil>", negate: true)

      xctestProxy.fail(message, file: file, line: line)
    }
  }
}
