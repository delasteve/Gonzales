public extension Int {
  var should: EquatableMatcher<Int> { return EquatableMatcher<Int>(self) }
}
