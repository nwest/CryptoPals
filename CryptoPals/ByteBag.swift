//
//  ByteBag.swift
//  CryptoPals
//
//  Created by Nate West on 5/3/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

struct ByteBag: Hashable {
    let bytes: [UInt8]

    var hashValue: Int {
        let values: [Int] = map(self.bytes) {$0.hashValue}
        let combined: Int = reduce(values, 0, +)

        return combined
    }
}

func ==(lhs: ByteBag, rhs: ByteBag) -> Bool {
    return lhs.hashValue == rhs.hashValue
}