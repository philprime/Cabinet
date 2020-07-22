import Quick
import Nimble
@testable import Cabinet

class CustomStringConvertible_AutoDescribingSpec: QuickSpec {

    override func spec() {
        describe("CustomStringConvertible") {
            describe("AutoDescribing") {
                class Question: CustomStringConvertible {
                    let number: Int
                    let text: String

                    init(number: Int, text: String) {
                        self.number = number
                        self.text = text
                    }
                }

                let question = Question(number: 42, text: "is the answer")

                it("should contain all fields") {
                    expect(question.description.hasPrefix("Question<")) == true
                    expect(question.description.hasSuffix(">(number: 42, text: is the answer)")) == true
                }
            }
        }
        describe("CustomDebugStringConvertible") {
            describe("AutoDescribing") {
                class Question: CustomStringConvertible {
                    let number: Int
                    let text: String

                    init(number: Int, text: String) {
                        self.number = number
                        self.text = text
                    }
                }

                let question = Question(number: 42, text: "is the answer")

                it("should contain all fields") {
                    expect(question.description.hasPrefix("Question<")) == true
                    expect(question.description.hasSuffix(">(number: 42, text: is the answer)")) == true
                }
            }
        }
    }
}
