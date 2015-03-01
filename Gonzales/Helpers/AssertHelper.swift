import XCTest

public class AssertHelper {

  public init() { }

  public func buildMessage(beginning: String, _ end: String, negate: Bool) -> String {
    var seperator = " "

    if negate {
      return seperator.join([beginning, "not", end])
    } else {
      return seperator.join([beginning, end])
    }
  }

  public func fail(message: String, _ file: String, _ line: UInt) {
    XCTFail(message, file: file, line: line)
  }
}
