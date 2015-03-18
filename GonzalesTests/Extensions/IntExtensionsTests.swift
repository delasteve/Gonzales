import XCTest
import Gonzales

class IntExtensionsTests: XCTestCase {
  func test_Int_has_property_should_of_type_EquatableMatcherInt() {
    var actual = 5.should as Any

    XCTAssertTrue(actual is EquatableMatcher<Int>)
  }
}
