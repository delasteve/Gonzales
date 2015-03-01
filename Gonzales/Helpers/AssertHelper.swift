import XCTest

public class AssertHelper {

  public init() { }

  public func fail(message: String, _ file: String, _ line: UInt) {
    XCTFail(message, file: file, line: line)
  }
}
