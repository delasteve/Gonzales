public class BaseMatcher {
  internal func buildMessage(beginning: String, _ end: String, negate: Bool) -> String {
    var seperator = " "

    if negate {
      return seperator.join([beginning, "not", end])
    } else {
      return seperator.join([beginning, end])
    }
  }
}