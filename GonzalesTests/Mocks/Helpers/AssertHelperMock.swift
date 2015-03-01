import Gonzales

public class AssertHelperMock: AssertHelper {
  public var failWasCalled: Bool
  public var failFile: String
  public var failLine: UInt
  public var failMessage: String

  public override init() {
    failMessage = ""
    failFile = __FILE__
    failLine = 0
    failWasCalled = false

    super.init()
  }

  public override func fail(message: String, _ file: String, _ line: UInt) {
    failWasCalled = true
    failFile = file
    failLine = line
    failMessage = message
  }
}