public class BoolMatcher {
  private var actual: Bool
  private var assertHelper: AssertHelper

  public init(_ actual: Bool, assertHelper: AssertHelper) {
    self.actual = actual
    self.assertHelper = assertHelper
  }

  public var be: BoolMatcher {
    get {
      return self
    }
  }

  public func truthy(file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual != true

    if comparison {
     var message = assertHelper.buildMessage("Expected <\(actual)> to", "equal <\(true)>", negate: false)

      assertHelper.fail(message, file: file, line: line)
    }
  }
  
  public func falsy(file: String = __FILE__, line: UInt = __LINE__) {
    var comparison = actual != false

    if comparison {
      var message = assertHelper.buildMessage("Expected <\(actual)> to", "equal <\(false)>", negate: false)

      assertHelper.fail(message, file: file, line: line)
    }
  }
}