public extension Int {
  var should: IntMatcher { return IntMatcher(self, assertHelper: AssertHelper()) }
}
