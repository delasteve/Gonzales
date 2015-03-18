import XCTest
import Gonzales

class BoolExtensionsTests: XCTestCase {
  func test_Bool_has_property_should_of_type_EquatableMatcherBool() {
    var actual = true.should as Any

    (actual is EquatableMatcher<Bool>).should.equal(true)
  }
}
