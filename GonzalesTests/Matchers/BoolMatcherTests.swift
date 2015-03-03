import Gonzales
import XCTest

class BoolMatcherTests: XCTestCase {
  var helperMock: AssertHelperMock!
  var trueBoolMatcher: BoolMatcher!
  var falseBoolMatcher: BoolMatcher!

  override func setUp() {
    helperMock = AssertHelperMock()
    trueBoolMatcher = BoolMatcher(true, assertHelper: helperMock)
    falseBoolMatcher = BoolMatcher(false, assertHelper: helperMock)
  }

  func test_be_property_that_returns_itself() {
    XCTAssertTrue((trueBoolMatcher.be as Any) is BoolMatcher)
  }

  func test_truthy_does_not_call_assert_helper_fail_when_equal() {
    trueBoolMatcher.be.truthy()

    XCTAssertEqual(helperMock.failWasCalled, false)
  }

  func test_truthy_calls_assert_helper_fail_when_not_equal() {
    falseBoolMatcher.be.truthy()

    XCTAssertEqual(helperMock.failWasCalled, true)
  }

  func test_truthy_calls_assert_helper_fail_with_pretty_fail_message_when_not_equal() {
    falseBoolMatcher.be.truthy()

    var expectedMessage = "Expected <false> to equal <true>"

    XCTAssertEqual(helperMock.failMessage, expectedMessage)
  }

  func test_truthy_passes_test_file_to_assert_helper_fail_when_not_equal() {
    falseBoolMatcher.be.truthy()

    XCTAssertEqual(helperMock.failFile, __FILE__)
  }

  func test_truthy_passes_line_number_to_assert_helper_fail_when_not_equal() {
    falseBoolMatcher.be.truthy()

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(helperMock.failLine, expectedLine)
  }

  func test_falsy_does_not_call_assert_helper_fail_when_equal() {
    falseBoolMatcher.be.falsy()

    XCTAssertEqual(helperMock.failWasCalled, false)
  }

  func test_falsy_calls_assert_helper_fail_when_not_equal() {
    trueBoolMatcher.be.falsy()

    XCTAssertEqual(helperMock.failWasCalled, true)
  }

  func test_falsy_calls_assert_helper_fail_with_pretty_fail_message_when_not_equal() {
    trueBoolMatcher.be.falsy()

    var expectedMessage = "Expected <true> to equal <false>"

    XCTAssertEqual(helperMock.failMessage, expectedMessage)
  }

  func test_falsy_passes_test_file_to_assert_helper_fail_when_not_equal() {
    trueBoolMatcher.be.falsy()

    XCTAssertEqual(helperMock.failFile, __FILE__)
  }

  func test_falsy_passes_line_number_to_assert_helper_fail_when_not_equal() {
    trueBoolMatcher.be.falsy()

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(helperMock.failLine, expectedLine)
  }
}