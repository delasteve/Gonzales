import Gonzales
import XCTest

class AssertHelpertests: XCTestCase {
  var assertHelper: AssertHelper!

  override func setUp() {
    assertHelper = AssertHelper()
  }

  func test_buildMessage_can_build_positive_message() {
    var actualMessage = assertHelper.buildMessage("a", "b", negate: false)
    var expectedMessage = "a b"

    XCTAssertEqual(expectedMessage, actualMessage)
  }

  func test_buildMessage_can_build_negative_message() {
    var actualMessage = assertHelper.buildMessage("a", "b", negate: true)
    var expectedMessage = "a not b"

    XCTAssertEqual(expectedMessage, actualMessage)
  }
}