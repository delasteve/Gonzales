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

    negateAndCompareIfNecessary(comparison, actual: actual, expected: expected, file: file, line: line)
  }

  public func equal(expected: Int8, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  public func equal(expected: Int16, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  public func equal(expected: Int32, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  public func equal(expected: Int64, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  public func equal(expected: UInt, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  public func equal(expected: UInt8, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  public func equal(expected: UInt16, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  public func equal(expected: UInt32, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  public func equal(expected: UInt64, file: String = __FILE__, line: UInt = __LINE__) {
    var expectedAsInt = Int(expected)

    equal(expectedAsInt, file: file, line: line)
  }

  private func negateAndCompareIfNecessary(comparison: Bool, actual: Int, expected: Int, file: String, line: UInt) {
    var compare = comparison

    if negate {
      compare = !compare
    }

    if compare {
      fail("Expected <\(actual)> to", end: "equal <\(expected)>", file: file, line: line)
    }
  }

  private func fail(beginning: String, end: String, file: String, line: UInt) {
    var message = buildMessage(beginning, end, negate: negate)

    xctestProxy.fail(message, file: file, line: line)
  }
}
