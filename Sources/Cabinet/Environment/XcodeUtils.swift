//
//  XcodeUtil.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 25.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

import Darwin

public enum XcodeUtil {

    /// Checks for the PTRACE system call, which is most likely set by Xcode
    public static var isProcessRunFromXcode: Bool {
        var info = kinfo_proc()
        var mib : [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout.stride(ofValue: info)
        let junk = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
        assert(junk == 0, "sysctl failed")
        return (info.kp_proc.p_flag & P_TRACED) != 0
    }
}
