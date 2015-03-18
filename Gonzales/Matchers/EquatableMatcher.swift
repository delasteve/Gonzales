public class EquatableMatcher<T: Equatable> : BaseMatcher {
  private let actual: T
  private var negate: Bool

  public init(_ actual: T, xctestProxy: XCTestProxyProtocol = XCTestProxy()) {
    self.actual = actual
    self.negate = false

    super.init(xctestProxy: xctestProxy)
  }

  public var be: EquatableMatcher {
    return self
  }

  public var not: EquatableMatcher {
    negate = !negate

    return self
  }

  public func equal(expected: T, file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual != expected

    if negate {
      comparison = !comparison
    }

    if comparison {
      let message = buildMessage("Expected <\(actual)> to", end: "equal <\(expected)>", negate: negate)

      fail(message, file: file, line: line)
    }
  }
}
