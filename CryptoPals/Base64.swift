//
//  Base64.swift
//  CryptoPals
//
//  Created by Nate West on 3/17/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

func base64Encode(bytes: [UInt8]) -> String {
    let reference = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")
    var encoded = ""
    for chunk in bytes.by(3) {

        var pad: [Character] = []
        var paddedChunk = chunk
        while paddedChunk.count < 3 {
            paddedChunk.append(UInt8())
            pad.append("=")
        }

        let group32 = UInt32(paddedChunk[0]) << 16 | UInt32(paddedChunk[1]) << 8 | UInt32(paddedChunk[2])

        let p0 = Int(UInt32(group32 >> 18) & 63)
        let p1 = Int(UInt32(group32 >> 12) & 63)
        let p2 = Int(UInt32(group32 >> 6) & 63)
        let p3 = Int(UInt32(group32 >> 0) & 63)

        encoded.append(reference[Int(p0)])
        encoded.append(reference[Int(p1)])
        encoded.append(reference[Int(p2)])
        encoded.append(reference[Int(p3)])

        if (pad.count > 0) {
            var encodedArray = Array(encoded)
            for _ in 0..<pad.count {
                encodedArray.removeLast()
            }
            for p in pad {
                encodedArray.append("=")
            }
            encoded = reduce(encodedArray, "", appendCharacter)
        }
    }

    return encoded
}

func base64Decode(s:String) -> [UInt8] {
    let reference = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/")
    var bytes: [UInt8] = []
    let cs: [Character] = Array(s)

    for quad in cs.by(4) {
        var cleanQuad:[Character] = []
        for c in quad {
            if (c != "=") {
                cleanQuad.append(c)
            }
            else {
                cleanQuad.append("A")
            }
        }

        let group32: UInt32 = UInt32(find(reference, cleanQuad[0])!) << 18 |
                              UInt32(find(reference, cleanQuad[1])!) << 12 |
                              UInt32(find(reference, cleanQuad[2])!) << 6 |
                              UInt32(find(reference, cleanQuad[3])!)

        bytes.append(UInt8(group32 >> 16 & 0xFF))
        bytes.append(UInt8(group32 >> 8 & 0xFF))
        bytes.append(UInt8(group32 & 0xFF))
    }

    return bytes
}

