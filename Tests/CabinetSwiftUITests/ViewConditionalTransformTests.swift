import XCTest
import SwiftUI
import ViewInspector
@testable import CabinetSwiftUI

class ViewConditionalTransformTests: XCTestCase {

    let baseItems2:  (Int?, Int?)                                                   = (1, 2)
    let baseItems3:  (Int?, Int?, Int?)                                             = (1, 2, 3)
    let baseItems4:  (Int?, Int?, Int?, Int?)                                       = (1, 2, 3, 4)
    let baseItems5:  (Int?, Int?, Int?, Int?, Int?)                                 = (1, 2, 3, 4, 5)
    let baseItems6:  (Int?, Int?, Int?, Int?, Int?, Int?)                           = (1, 2, 3, 4, 5, 6)
    let baseItems7:  (Int?, Int?, Int?, Int?, Int?, Int?, Int?)                     = (1, 2, 3, 4, 5, 6, 7)
    let baseItems8:  (Int?, Int?, Int?, Int?, Int?, Int?, Int?, Int?)               = (1, 2, 3, 4, 5, 6, 7, 8)
    let baseItems9:  (Int?, Int?, Int?, Int?, Int?, Int?, Int?, Int?, Int?)         = (1, 2, 3, 4, 5, 6, 7, 8, 9)
    let baseItems10: (Int?, Int?, Int?, Int?, Int?, Int?, Int?, Int?, Int?, Int?)   = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

    func testIf_conditionRejects_shouldReturnTransformedView() throws {
        let sut = Text("Hello")
            .if(false) { input in
                Text("\(input), World!")
            }
        _ = try sut.inspect().find(text: "Hello")
    }

    func testIf_conditionResolves_shouldReturnTransformedView() {
        let sut = Text("Hello, World!")
            .if(true) { input in
                input.bold()
            }
        XCTAssertTrue(try sut.inspect().find(text: "Hello, World!").attributes().isBold())
    }

    func testIfElse_conditionRejects_shouldReturnTransformedView() {
        let sut = Text("Hello, World!")
            .ifelse(false) { input in
                input.bold()
            } elseTransform: { input in
                input.italic()
            }
        XCTAssertTrue(try sut.inspect().find(text: "Hello, World!").attributes().isItalic())
    }

    func testIfElse_conditionResolves_shouldReturnTransformedView() {
        let sut = Text("Hello, World!")
            .ifelse(true) { input in
                input.bold()
            } elseTransform: { input in
                input.italic()
            }
        XCTAssertTrue(try sut.inspect().find(text: "Hello, World!").attributes().isBold())
    }

    func testIfItem_conditionRejects_shouldReturnTransformedView() throws {
        let item: String? = nil
        let sut = Text("Hello")
            .if(item: item) { input, item in
                Text("\(input) \(Text(item))")
            }
        _ = try sut.inspect().find(text: "Hello")
    }

    func testIfItem_conditionResolves_shouldReturnTransformedView() throws {
        let item: String? = "World!"
        let sut = Text("Hello")
            .if(item: item) { input, item in
                Text("\(input) \(Text(item))")
            }
        _ = try sut.inspect().find(text: "Hello World!")
    }

    func testIfItem2_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 2
        for idx in 0..<itemsCount {
            var items = baseItems2
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem2_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems2) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2)")
    }

    func testIfItem3_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 3
        for idx in 0..<itemsCount {
            var items = baseItems5
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem3_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems3) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2, 3)")
    }

    func testIfItem4_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 4
        for idx in 0..<itemsCount {
            var items = baseItems5
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem4_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems4) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2, 3, 4)")
    }

    func testIfItem5_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 5
        for idx in 0..<itemsCount {
            var items = baseItems5
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem5_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems5) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2, 3, 4, 5)")
    }

    func testIfItem6_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 6
        for idx in 0..<itemsCount {
            var items = baseItems6
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem6_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems6) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2, 3, 4, 5, 6)")
    }

    func testIfItem7_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 7
        for idx in 0..<itemsCount {
            var items = baseItems7
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem7_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems7) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2, 3, 4, 5, 6, 7)")
    }

    func testIfItem8_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 8
        for idx in 0..<itemsCount {
            var items = baseItems8
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem8_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems8) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2, 3, 4, 5, 6, 7, 8)")
    }

    func testIfItem9_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 9
        for idx in 0..<itemsCount {
            var items = baseItems9
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem9_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems9) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2, 3, 4, 5, 6, 7, 8, 9)")
    }

    func testIfItem10_anyValueIsNil_shouldNotReturnTransformedView() throws {
        let itemsCount = 10
        for idx in 0..<itemsCount {
            var items = baseItems10
            withUnsafeMutablePointer(to: &items) { pointer in
                pointer.withMemoryRebound(to: Optional<Int>.self, capacity: itemsCount) { buffer in
                    buffer[idx] = nil
                }
            }
            let sut = Text("Items:")
                .if(items: items) { input, items in
                    Text("\(input) \(String(describing: items))")
                }
            _ = try sut.inspect().find(text: "Items:")
        }
    }

    func testIfItem10_allValuesGiven_shouldReturnTransformedView() throws {
        let sut = Text("Items:")
            .if(items: baseItems10) { input, items in
                Text("\(input) \(String(describing: items))")
            }
        _ = try sut.inspect().find(text: "Items: (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)")
    }
}
