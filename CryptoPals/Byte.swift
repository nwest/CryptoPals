//
//  Byte.swift
//  CryptoPals
//
//  Created by Nate West on 3/22/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

func base2(bs:[UInt8]) -> [UInt8] {
    let bst = map(bs, { Array(padBase2(String($0, radix:2), 8)) }).reduce([], combine: +)
    return map(bst) { UInt8(String($0).toInt()!) }
}

private func padBase2(s: String, size: Int) -> String {
    if (Array(s).count < size) {
        return padBase2("0" + s, size)
    }
    return s
}
