import XCTest
import Gonzales

class BoolMatcherTests: XCTestCase {
  var xctestProxyMock: XCTestProxyMock!
  var trueBoolMatcher: BoolMatcher!
  var falseBoolMatcher: BoolMatcher!

  override func setUp() {
    xctestProxyMock = XCTestProxyMock()
    trueBoolMatcher = BoolMatcher(true, xctestProxy: xctestProxyMock)
    falseBoolMatcher = BoolMatcher(false, xctestProxy: xctestProxyMock)
  }

  func test_be_property_that_returns_itself() {
    var matcher = trueBoolMatcher as Any

    (matcher is BoolMatcher).should.be.truthy()
  }

  func test_truthy_does_not_call_xctest_proxy_fail_when_equal() {
    trueBoolMatcher.be.truthy()

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_truthy_calls_xctest_proxy_fail_when_not_equal() {
    falseBoolMatcher.be.truthy()

    xctestProxyMock.failWasCalled.should.be.truthy()
  }

  func test_truthy_calls_xctest_proxy_fail_with_pretty_fail_message_when_not_equal() {
    falseBoolMatcher.be.truthy()

    var expectedMessage = "Expected <false> to equal <true>"

    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_truthy_passes_test_file_to_xctest_proxy_fail_when_not_equal() {
    falseBoolMatcher.be.truthy()

    XCTAssertEqual(xctestProxyMock.failFile, __FILE__)
  }

  func test_truthy_passes_line_number_to_xctest_proxy_fail_when_not_equal() {
    falseBoolMatcher.be.truthy()

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(xctestProxyMock.failLine, expectedLine)
  }

  func test_falsy_does_not_call_xctest_proxy_fail_when_equal() {
    falseBoolMatcher.be.falsy()

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_falsy_calls_xctest_proxy_fail_when_not_equal() {
    trueBoolMatcher.be.falsy()

    xctestProxyMock.failWasCalled.should.be.truthy()
  }

  func test_falsy_calls_xctest_proxy_fail_with_pretty_fail_message_when_not_equal() {
    trueBoolMatcher.be.falsy()

    var expectedMessage = "Expected <true> to equal <false>"

    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_falsy_passes_test_file_to_xctest_proxy_fail_when_not_equal() {
    trueBoolMatcher.be.falsy()

    XCTAssertEqual(xctestProxyMock.failFile, __FILE__)
  }

  func test_falsy_passes_line_number_to_xctest_proxy_fail_when_not_equal() {
    trueBoolMatcher.be.falsy()

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(xctestProxyMock.failLine, expectedLine)
  }
}