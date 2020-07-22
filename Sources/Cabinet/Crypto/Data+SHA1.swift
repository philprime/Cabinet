//
//  Data+SHA1.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 21.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

import Foundation
import CommonCrypto
import CryptoKit

extension Data {

    /// Creates a SHA1 hash byte array from the given data
    public var sha1: [UInt8] {
        if #available(iOS 13.0, tvOS 13.0, OSX 10.15, *) {
            return [UInt8](Insecure.SHA1.hash(data: self))
        } else {
            var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
            self.withUnsafeBytes { bytes in
                _ = CC_SHA1(bytes.baseAddress, CC_LONG(self.count), &digest)
            }
            return digest
        }
    }
    
}
