import XCTest
@testable import CabinetCore

class CustomStringConvertible_AutoDescribingSpec: XCTestCase {

    func testCustomStringConvertible_shouldContainAllFields() {
        class Question: CustomStringConvertible {
            let number: Int
            let text: String

            init(number: Int, text: String) {
                self.number = number
                self.text = text
            }
        }

        let question = Question(number: 42, text: "is the answer")

        XCTAssertTrue(question.description.hasPrefix("Question<"))
        XCTAssertTrue(question.description.hasSuffix(">(number: 42, text: is the answer)"))
    }

    func testCustomDebugStringConvertible_shouldContainAllFields() {
        class Question: CustomStringConvertible {
            let number: Int
            let text: String

            init(number: Int, text: String) {
                self.number = number
                self.text = text
            }
        }

        let question = Question(number: 42, text: "is the answer")

        XCTAssertTrue(question.description.hasPrefix("Question<"))
        XCTAssertTrue(question.description.hasSuffix(">(number: 42, text: is the answer)"))
    }
}
