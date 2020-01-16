import Foundation

public extension FileManager {

    func removeAllItemsInFolder(at url: URL) {
        if fileExists(atPath: url.path) {
            try? removeItem(at: url)
        }
        try? createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    }
}
