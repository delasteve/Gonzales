import Gonzales
import XCTest

class ShouldMatcherTests: XCTestCase {
  var helperMock: AssertHelperMock!
  var shouldMatcher: ShouldMatcher!

  override func setUp() {
    helperMock = AssertHelperMock()
    shouldMatcher = ShouldMatcher(assertHelper: helperMock)
  }

  func test_exist_does_not_call_assert_helper_fail_when_not_nil() {
    shouldMatcher.exist(NSObject())

    XCTAssertEqual(helperMock.failWasCalled, false)
  }

  func test_exist_calls_assert_helper_fail_when_nil() {
    shouldMatcher.exist(NSObject?())

    XCTAssertEqual(helperMock.failWasCalled, true)
  }

  func test_exist_calls_assert_helper_fail_with_pretty_fail_message_when_nil() {
    shouldMatcher.exist(Double?())

    var expectedMessage = "Expected <nil> to not be <nil>"

    XCTAssertEqual(helperMock.failMessage, expectedMessage)
  }

  func test_exist_passes_test_file_to_assert_helper_fail_when_nil() {
    shouldMatcher.exist(Int?())

    XCTAssertEqual(helperMock.failFile, __FILE__)
  }

  func test_exist_passes_line_number_to_assert_helper_fail_when_nil() {
    shouldMatcher.exist(NSArray?())

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(helperMock.failLine, expectedLine)
  }
}
