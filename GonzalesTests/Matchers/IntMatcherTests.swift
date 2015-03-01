import Gonzales
import XCTest

class IntMatcherTests: XCTestCase {
  var helperMock: AssertHelperMock!
  var intMatcher: IntMatcher!

  override func setUp() {
    helperMock = AssertHelperMock()
    intMatcher = IntMatcher(5, helperMock)
  }

  func test_be_that_returns_itself() {
    XCTAssertTrue((intMatcher.be as Any) is IntMatcher)
  }

  func test_equal_does_not_call_assert_helper_fail_when_equal() {
    intMatcher.be.equal(5)

    XCTAssertEqual(helperMock.failWasCalled, false)
  }
  
  func test_equal_calls_assert_helper_fail_when_not_equal() {
    intMatcher.be.equal(6)

    XCTAssertEqual(helperMock.failWasCalled, true)
  }

  func test_equal_calls_assert_helper_fail_with_pretty_fail_message_when_not_equal() {
    intMatcher.be.equal(6)

    XCTAssertEqual(helperMock.failMessage, "<5> does not equal <6>")
  }

  func test_equals_passes_test_file_to_assert_helper_fail_when_not_equal() {
    intMatcher.be.equal(6)

    XCTAssertEqual(helperMock.failFile, __FILE__)
  }

  func test_equals_passes_line_number_to_assert_helper_fail_when_not_equal() {
    intMatcher.be.equal(6)

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(helperMock.failLine, expectedLine)
  }
}