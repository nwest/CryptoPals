//
//  NSData.swift
//  CryptoPals
//
//  Created by Nate West on 3/23/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

extension NSData {
    convenience init(_ data: [UInt8]) {
        self.init(bytes: data, length: data.count)
    }

    func rawBytes() -> [UInt8] {
        let count = self.length / sizeof(UInt8)
        var bytes = [UInt8](count: count, repeatedValue:0)
        self.getBytes(&bytes, length: count * sizeof(UInt8))
        return bytes
    }
}
