import XCTest
import Gonzales

class EquatableMatcherTests: XCTestCase {
  var xctestProxyMock: XCTestProxyMock!
  var equatableMatcher: EquatableMatcher<Int>!

  override func setUp() {
    xctestProxyMock = XCTestProxyMock()
    equatableMatcher = EquatableMatcher<Int>(5, xctestProxy: xctestProxyMock)
  }

  func test_be_property_that_returns_itself() {
    var matcher = equatableMatcher.be as Any

    (matcher is EquatableMatcher<Int>).should.equal(true)
  }

  func test_equal_does_not_call_xctest_proxy_fail_when_equal() {
    equatableMatcher.be.equal(5)

    xctestProxyMock.failWasCalled.should.equal(false)
  }

  func test_equal_calls_xctest_proxy_fail_when_not_equal() {
    equatableMatcher.be.equal(6)

    xctestProxyMock.failWasCalled.should.equal(true)
  }

  func test_equal_calls_xctest_proxy_fail_with_pretty_fail_message_when_not_equal() {
    equatableMatcher.be.equal(6)

    var expectedMessage = "Expected <5> to equal <6>"

    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equal_passes_test_file_to_xctest_proxy_fail_when_not_equal() {
    equatableMatcher.be.equal(6)

    XCTAssertEqual(xctestProxyMock.failFile, __FILE__)
  }

  func test_equal_passes_line_number_to_xctest_proxy_fail_when_not_equal() {
    equatableMatcher.be.equal(6)

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(xctestProxyMock.failLine, expectedLine)
  }

  func test_not_negates_assertions() {
    equatableMatcher.not.be.equal(6)

    xctestProxyMock.failWasCalled.should.equal(false)
  }

  func test_not_changes_assertion_message_for_equal() {
    equatableMatcher.not.be.equal(5)

    var expectedMessage = "Expected <5> to not equal <5>"

    xctestProxyMock.failWasCalled.should.equal(true)
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_double_negation_equal_does_not_fail_test() {
    equatableMatcher.not.not.be.equal(5)

    xctestProxyMock.failWasCalled.should.equal(false)
  }
}
