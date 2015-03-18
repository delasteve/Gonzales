public extension Bool {
  var should: EquatableMatcher<Bool> { return EquatableMatcher<Bool>(self) }
}
