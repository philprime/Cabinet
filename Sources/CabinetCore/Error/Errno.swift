import Darwin

/// Utility class for handling OS-level errors
public class Errno {

    /// Returns a readable message from the current system `errno` code
    public static var description: String {
        guard let cmsg = strerror(errno) else {
            return "No Error found"
        }
        let msg = String(validatingUTF8: cmsg) ?? "Unknown Error"
        return "\(msg) (\(errno))"
    }
}
