public class BoolMatcher: BaseMatcher  {
  private var actual: Bool
  private var xctestProxy: XCTestProxyProtocol

  public init(_ actual: Bool, xctestProxy: XCTestProxyProtocol = XCTestProxy()) {
    self.actual = actual
    self.xctestProxy = xctestProxy
  }

  public var be: BoolMatcher {
    get {
      return self
    }
  }

  public func truthy(file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual != true

    failIfNecessary(comparison, expected: true, file: file, line: line)
  }
  
  public func falsy(file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual != false

    failIfNecessary(comparison, expected: false, file: file, line: line)
  }

  private func failIfNecessary(comparison: Bool, expected: Bool, file: String, line: UInt) {
    if comparison {
      var message = buildMessage("Expected <\(actual)> to", "equal <\(expected)>", negate: false)

      xctestProxy.fail(message, file: file, line: line)
    }

  }
}