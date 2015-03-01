public class ShouldMatcher {
  private var assertHelper: AssertHelper

  public init(assertHelper: AssertHelper) {
    self.assertHelper = assertHelper
  }

  public func exist(actual: AnyObject?, file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual == nil

    if comparison {
      var message = assertHelper.buildMessage("Expected <\(actual)> to", "be <nil>", negate: true)

      assertHelper.fail(message, file: file, line: line)
    }
  }
}
