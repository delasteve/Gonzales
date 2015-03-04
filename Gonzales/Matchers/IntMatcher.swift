public class IntMatcher: BaseMatcher {
  private var actual: Int
  private var xctestProxy: XCTestProxyProtocol
  private var negate: Bool

  public init(_ actual: Int, xctestProxy: XCTestProxyProtocol = XCTestProxy()) {
    self.actual = actual
    self.xctestProxy = xctestProxy
    self.negate = false
  }

  public var be: IntMatcher {
    get {
      return self
    }
  }

  public var not: IntMatcher {
    get {
      negate = true
      return self
    }
  }

  public func equal(expected: Int, file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual != expected

    if negate {
      comparison = !comparison
    }

    if comparison {
      var message = buildMessage("Expected <\(actual)> to", "equal <\(expected)>", negate: negate)

      xctestProxy.fail(message, file: file, line: line)
    }
  }
}
