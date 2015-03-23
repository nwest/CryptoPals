//
//  String.swift
//  CryptoPals
//
//  Created by Nate West on 3/22/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

extension String {
    func ord() -> [UInt8] {
        return [UInt8](self.utf8)
    }
}