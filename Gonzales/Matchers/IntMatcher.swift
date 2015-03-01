public class IntMatcher {
  private var actual: Int
  private var assertHelper: AssertHelper
  private var negate: Bool

  public init(_ actual: Int, _ assertHelper: AssertHelper) {
    self.actual = actual
    self.assertHelper = assertHelper
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
      var message = assertHelper.buildMessage("Expected <\(actual)> to", "equal <\(expected)>", negate: negate)

      assertHelper.fail(message, file: file, line: line)
    }
  }
}
