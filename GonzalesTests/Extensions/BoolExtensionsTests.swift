import Gonzales
import XCTest

class BoolExtensionsTests: XCTestCase {
  func test_has_property_should_of_type_BoolMatcher() {
    var actual = true.should as Any

    XCTAssert(actual is BoolMatcher)
  }
}
