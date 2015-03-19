import XCTest
import Gonzales

class OptionalMatcherTests: XCTestCase {
  var xctestProxyMock: XCTestProxyMock!
  var optionalMatcher: OptionalMatcher!

  override func setUp() {
    xctestProxyMock = XCTestProxyMock()
    optionalMatcher = OptionalMatcher(xctestProxy: xctestProxyMock)
  }

  func test_exist_does_not_call_xctest_proxy_fail_when_not_nil() {
    optionalMatcher.exist(NSObject())

    xctestProxyMock.failWasCalled.should.equal(false)
  }

  func test_exist_calls_xctest_proxy_fail_when_nil() {
    optionalMatcher.exist(NSObject?())

    xctestProxyMock.failWasCalled.should.equal(true)
  }

  func test_exist_calls_xctest_proxy_fail_with_pretty_fail_message_when_nil() {
    optionalMatcher.exist(Double?())

    var expectedMessage = "Expected <nil> to not be <nil>"

    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_exist_passes_test_file_to_xctest_proxy_fail_when_nil() {
    optionalMatcher.exist(Int?())

    XCTAssertEqual(xctestProxyMock.failFile, __FILE__)
  }

  func test_exist_passes_line_number_to_xctest_proxy_fail_when_nil() {
    optionalMatcher.exist(NSArray?())

    var expectedLine = __LINE__ - 2 as UInt

    XCTAssertEqual(xctestProxyMock.failLine, expectedLine)
  }
}
