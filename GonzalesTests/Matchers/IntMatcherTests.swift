import Gonzales
import XCTest

class IntMatcherTests: XCTestCase {
  var helperMock: AssertHelperMock!
  var intMatcher: IntMatcher!

  override func setUp() {
    helperMock = AssertHelperMock()
    intMatcher = IntMatcher(5, assertHelper: helperMock)
  }

  func test_be_property_that_returns_itself() {
    var matcher = intMatcher.be as Any

    (matcher is IntMatcher).should.be.truthy()
  }

  func test_equal_does_not_call_assert_helper_fail_when_equal() {
    intMatcher.be.equal(5)

    helperMock.failWasCalled.should.be.falsy()
  }
  
  func test_equal_calls_assert_helper_fail_when_not_equal() {
    intMatcher.be.equal(6)

    helperMock.failWasCalled.should.be.truthy()
  }

  func test_equal_calls_assert_helper_fail_with_pretty_fail_message_when_not_equal() {
    intMatcher.be.equal(6)

    var expectedMessage = "Expected <5> to equal <6>"

    XCTAssertEqual(helperMock.failMessage, expectedMessage)
  }

  func test_equal_passes_test_file_to_assert_helper_fail_when_not_equal() {
    intMatcher.be.equal(6)

    XCTAssertEqual(helperMock.failFile, __FILE__)
  }

  func test_equal_passes_line_number_to_assert_helper_fail_when_not_equal() {
    intMatcher.be.equal(6)

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(helperMock.failLine, expectedLine)
  }

  func test_not_negates_assertions() {
    intMatcher.not.be.equal(6)

    helperMock.failWasCalled.should.be.falsy()
  }

  func test_not_changes_assertion_message_for_equal() {
    intMatcher.not.be.equal(5)

    var expectedMessage = "Expected <5> to not equal <5>"

    helperMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(helperMock.failMessage, expectedMessage)
  }
}
