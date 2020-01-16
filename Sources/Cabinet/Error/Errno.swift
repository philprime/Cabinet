import Darwin

public class Errno {
    
    public static var description: String {
        guard let cmsg = strerror(errno) else {
            return "No Error found"
        }
        let msg = String(validatingUTF8: cmsg) ?? "Unknown Error"
        return "\(msg) (\(errno))"
    }
}
