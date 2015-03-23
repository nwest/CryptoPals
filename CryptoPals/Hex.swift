//
//  Hex.swift
//  CryptoPals
//
//  Created by Nate West on 3/17/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

func hexToRaw(s: String) -> [UInt8] {
    let rawChunks = Array(Array(s).by(2))
    let hexChunks: [String] = map(rawChunks, stringify)
    return map(hexChunks, bytes)
}

func stringify(s:Slice<Character>) -> String {
    return reduce(s, "", appendCharacter)
}

func appendCharacter(s: String, c: Character) -> String {
    return s + String(c)
}

func bytes(hex: String) -> UInt8 {
    return UInt8(strtoul(hex, nil, 16))
}

func hex(bs: UInt8) -> String {
    return String(bs, radix:16)
}

func rawToHex(rs: [UInt8]) -> String {
    let hexValues = map(rs, hex)
    return reduce(hexValues, "", +)
}