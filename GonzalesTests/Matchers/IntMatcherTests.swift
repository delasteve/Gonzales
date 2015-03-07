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

  func test_equals_passes_when_int_8_is_equal() {
    var actual:Int8 = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_int_8_is_not_equal() {
    var actual:Int8 = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equals_passes_when_int_16_is_equal() {
    var actual:Int16 = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_int_16_is_not_equal() {
    var actual:Int16 = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equals_passes_when_int_32_is_equal() {
    var actual:Int32 = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_int_32_is_not_equal() {
    var actual:Int32 = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equals_passes_when_int_64_is_equal() {
    var actual:Int64 = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_int_64_is_not_equal() {
    var actual:Int64 = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equals_passes_when_uint_is_equal() {
    var actual:UInt = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_uint_is_not_equal() {
    var actual:UInt = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equals_passes_when_uint_8_is_equal() {
    var actual:UInt8 = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_uint_8_is_not_equal() {
    var actual:UInt8 = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equals_passes_when_uint_16_is_equal() {
    var actual:UInt16 = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_uint_16_is_not_equal() {
    var actual:UInt16 = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equals_passes_when_uint_32_is_equal() {
    var actual:UInt32 = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_uint_32_is_not_equal() {
    var actual:UInt32 = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }

  func test_equals_passes_when_uint_64_is_equal() {
    var actual:UInt64 = 5

    intMatcher.be.equal(actual)

    xctestProxyMock.failWasCalled.should.be.falsy()
  }

  func test_equal_fails_when_uint_64_is_not_equal() {
    var actual:UInt64 = 8

    intMatcher.be.equal(actual)

    var expectedMessage = "Expected <5> to equal <8>"

    xctestProxyMock.failWasCalled.should.be.truthy()
    XCTAssertEqual(xctestProxyMock.failMessage, expectedMessage)
  }
}
