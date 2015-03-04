public extension Bool {
  var should: BoolMatcher { return BoolMatcher(self) }
}
