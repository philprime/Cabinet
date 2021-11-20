import Quick
import Nimble
@testable import CabinetCore
import Foundation

class FileManager_RemoveAllItemsSpec: QuickSpec {

    override func spec() {
        describe("FileManager") {
            describe("Remove All Items") {
                context("folder exists") {
                    it("should remove and recreate the folder") {
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
                        expect(fm.fileExists(atPath: tempURL.path)) == true
                        expect(try! fm.contentsOfDirectory(atPath: tempURL.path).count) == fileCount

                        fm.removeAllItemsInFolder(at: tempURL)

                        expect(fm.fileExists(atPath: tempURL.path)) == true
                        expect(try! fm.contentsOfDirectory(atPath: tempURL.path).isEmpty) == true
                    }
                }

                context("folder does not exist") {
                    it("should create the folder so it exists afterwards") {
                        let tempURL = URL(fileURLWithPath: NSTemporaryDirectory())
                            .appendingPathComponent(UUID().uuidString)

                        let fm = FileManager.default
                        expect(fm.fileExists(atPath: tempURL.path)) == false
                        fm.removeAllItemsInFolder(at: tempURL)
                        expect(fm.fileExists(atPath: tempURL.path)) == true
                    }
                }
            }
        }
    }
}
