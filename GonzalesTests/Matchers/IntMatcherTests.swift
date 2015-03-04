import XCTest
import Gonzales

class IntMatcherTests: XCTestCase {
  var xctestProxyMock: XCTestProxyMock!
  var intMatcher: IntMatcher!

  override func setUp() {
    xctestProxyMock = XCTestProxyMock()
    intMatcher = IntMatcher(5, xctestProxy: xctestProxyMock)
  }

  func test_be_property_that_returns_itself() {
    var matcher = intMatcher.be as Any

    (matcher is IntMatcher).should.be.truthy()
  }

  func test_equal_does_not_call_xctest_proxy_fail_when_equal() {
    intMatcher.be.equal(5)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }
  
  func test_equal_calls_xctest_proxy_fail_when_not_equal() {
    intMatcher.be.equal(6)

    xctestProxyMock.failWasCalled.should.be.truthy()
  }

  func test_equal_calls_xctest_proxy_fail_with_pretty_fail_message_when_not_equal() {
    intMatcher.be.equal(6)

    var expectedMessage = "Expected <5> to equal <6>"

    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equal_passes_test_file_to_xctest_proxy_fail_when_not_equal() {
    intMatcher.be.equal(6)

    XCTAssertEqual(xctestProxyMock.failFile, __FILE__)
  }

  func test_equal_passes_line_number_to_xctest_proxy_fail_when_not_equal() {
    intMatcher.be.equal(6)

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(xctestProxyMock.failLine, expectedLine)
  }

  func test_not_negates_assertions() {
    intMatcher.not.be.equal(6)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_not_changes_assertion_message_for_equal() {
    intMatcher.not.be.equal(5)

    var expectedMessage = "Expected <5> to not equal <5>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }
}
