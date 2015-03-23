//
//  Zip.swift
//  CryptoPals
//
//  Created by Nate West on 3/22/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

func Zip3<A, B, C> (a:[A], b:[B], c:[C]) -> [(A, B, C)] {
    var zipped: [(A, B, C)] = []
    for var i = 0; i < a.count; i++ {
        let foo: (A, B, C) = (a[i], b[i], c[i])
        zipped.append(foo)
    }
    return zipped
}
