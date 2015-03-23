//
//  Dictionary.swift
//  CryptoPals
//
//  Created by Nate West on 3/20/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

extension Dictionary {
    init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
}
