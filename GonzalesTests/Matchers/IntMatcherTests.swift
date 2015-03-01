import Gonzales
import XCTest

class IntMatcherTests: XCTestCase {
  var helperMock: AssertHelperMock!
  var should: IntMatcher!

  override func setUp() {
    helperMock = AssertHelperMock()
    should = IntMatcher(5, helperMock)
  }

  func test_be_property_that_returns_itself() {
    XCTAssertTrue((should.be as Any) is IntMatcher)
  }

  func test_equal_does_not_call_assert_helper_fail_when_equal() {
    should.be.equal(5)

    XCTAssertEqual(helperMock.failWasCalled, false)
  }
  
  func test_equal_calls_assert_helper_fail_when_not_equal() {
    should.be.equal(6)

    XCTAssertEqual(helperMock.failWasCalled, true)
  }

  func test_equal_calls_assert_helper_fail_with_pretty_fail_message_when_not_equal() {
    should.be.equal(6)

    var expectedMessage = "Expected <5> to equal <6>"

    XCTAssertEqual(helperMock.failMessage, expectedMessage)
  }

  func test_equals_passes_test_file_to_assert_helper_fail_when_not_equal() {
    should.be.equal(6)

    XCTAssertEqual(helperMock.failFile, __FILE__)
  }

  func test_equals_passes_line_number_to_assert_helper_fail_when_not_equal() {
    should.be.equal(6)

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(helperMock.failLine, expectedLine)
  }

  func test_not_negates_assertions() {
    should.not.be.equal(6)

    XCTAssertEqual(helperMock.failWasCalled, false)
  }

  func test_not_changes_assertion_message_for_equal() {
    should.not.be.equal(5)

    var expectedMessage = "Expected <5> to not equal <5>"

    XCTAssertEqual(helperMock.failWasCalled, true)
    XCTAssertEqual(helperMock.failMessage, expectedMessage)
  }
}