import XCTest
import Gonzales

class ShouldTests: XCTestCase {
  func test_global_property_should_of_type_OptionalMatcher() {
    var matcher = should as Any

    (matcher is OptionalMatcher).should.equal(true)
  }
}
