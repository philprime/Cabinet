import Foundation

public extension FileManager {

    /// Removes and recreates a folder at the given url
    ///
    /// - Parameter url: URL to folder
    func removeAllItemsInFolder(at url: URL) {
        if fileExists(atPath: url.path) {
            try? removeItem(at: url)
        }
        try? createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    }
}
