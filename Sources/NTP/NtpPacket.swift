//
//  NtpPacket.swift
//  NTP.swift
//
//  GitHub Repo and Documentation: https://github.com/danielepantaleone/NTP.swift
//
//  Copyright © 2025 Daniele Pantaleone. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

/// A structure representing an NTP packet, containing various timestamp fields and metadata.
struct NtpPacket: Sendable {
    
    /// The flags field, containing information about the NTP version, mode, and leap indicator.
    var flags: UInt8 = 0b10011011

    /// The stratum level of the NTP server.
    var stratum: UInt8 = 0
    
    /// The maximum interval between successive messages.
    var poll: UInt8 = 0
    
    /// The clock precision of the sender.
    var precision: UInt8 = 0

    /// The total round-trip delay to the primary reference source.
    var rootDelay: NtpTime32 = .init(whole: 0, fraction: 0)
    
    /// The nominal error estimate of the local clock.
    var rootDispersion: NtpTime32 = .init(whole: 0, fraction: 0)
    
    /// A reference identifier used to uniquely identify the NTP server.
    var referenceID: UInt32 = 0

    /// The time at which the system clock was last set or corrected.
    var referenceTime: NtpTime64 = .init(whole: 0, fraction: 0)
    
    /// The time at which the request packet departed from the client.
    var originateTime: NtpTime64 = .init(whole: 0, fraction: 0)
    
    /// The time at which the response packet left the server.
    var transmitTime: NtpTime64 = .init(whole: 0, fraction: 0)
    
    /// The time at which the request packet was received by the server.
    var receiveTime: NtpTime64 = .init(whole: 0, fraction: 0)
    
    /// Returns a new `NtpPacket` instance with byte-swapped values for fields that require endian conversion.
    var byteSwapped: NtpPacket {
        NtpPacket(
            flags: flags,
            stratum: stratum,
            poll: poll,
            precision: precision,
            rootDelay: rootDelay.byteSwapped,
            rootDispersion: rootDispersion.byteSwapped,
            referenceID: referenceID,
            referenceTime: referenceTime.byteSwapped,
            originateTime: originateTime.byteSwapped,
            transmitTime: transmitTime.byteSwapped,
            receiveTime: receiveTime.byteSwapped)
    }
    
    /// Returns the `NtpPacket` in the system's native byte order.
    ///
    /// If the system uses little-endian byte order, this returns the byte-swapped version, otherwise, it returns the packet as is.
    var nativeEndian: NtpPacket {
        CFByteOrderGetCurrent() == CFByteOrder(CFByteOrderLittleEndian.rawValue) ?
            byteSwapped :
            self
    }
    
}
