import Foundation
import XCTest
@testable import CabinetCore

class FileManager_RemoveAllItemsSpec: XCTestCase {

    func testRemoveAllItems_folderExists_shouldRemoveAndRecreateTheFolder() {
        let tempURL = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent("A")
            .appendingPathComponent("B")
            .appendingPathComponent("C")
            .appendingPathComponent("D")

        let fm = FileManager.default
        try! fm.createDirectory(at: tempURL, withIntermediateDirectories: true, attributes: nil)

        // Create files
        let fileCount = 5
        for i in 0..<fileCount {
            let data = "\(i)".data(using: .ascii)!
            let fileURL = tempURL
                .appendingPathComponent("\(i)")
                .appendingPathExtension("txt")
            try! data.write(to: fileURL)
        }
        XCTAssertEqual(fm.fileExists(atPath: tempURL.path), true)
        XCTAssertEqual(try! fm.contentsOfDirectory(atPath: tempURL.path).count, fileCount)

        fm.removeAllItemsInFolder(at: tempURL)

        XCTAssertEqual(fm.fileExists(atPath: tempURL.path), true)
        XCTAssertEqual(try! fm.contentsOfDirectory(atPath: tempURL.path).isEmpty, true)
    }

    func testRemoveAllItems_folderDoesNotExist_shouldCreateTheFolder() {
        let tempURL = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent(UUID().uuidString)

        let fm = FileManager.default
        XCTAssertEqual(fm.fileExists(atPath: tempURL.path), false)
        fm.removeAllItemsInFolder(at: tempURL)
        XCTAssertEqual(fm.fileExists(atPath: tempURL.path), true)
    }
}
