import Gonzales
import XCTest

class ShouldTests: XCTestCase {
  func test_global_property_should_of_type_ShouldMatcher() {
    var matcher = should as Any

    (matcher is ShouldMatcher).should.be.truthy()
  }
}