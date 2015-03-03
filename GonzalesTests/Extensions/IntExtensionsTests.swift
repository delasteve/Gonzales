import Gonzales
import XCTest

class IntExtensionsTests: XCTestCase {
  func test_has_property_should_of_type_IntMatcher() {
    var actual = 5.should as Any

    (actual is IntMatcher).should.be.truthy()
  }
}
