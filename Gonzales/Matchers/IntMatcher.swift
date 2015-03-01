public class IntMatcher {
  private var actual: Int
  private var assertHelper: AssertHelper

  public init(_ actual: Int, _ assertHelper: AssertHelper) {
    self.actual = actual
    self.assertHelper = assertHelper
  }

  public var be: IntMatcher {
    get {
      return self
    }
  }

  public func equal(expected: Int, file: String = __FILE__, line: UInt = __LINE__) {
    if actual != expected {
      assertHelper.fail("<\(actual)> does not equal <\(expected)>", file, line)
    }
  }
}