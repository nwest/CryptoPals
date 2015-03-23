//
//  Character.swift
//  CryptoPals
//
//  Created by Nate West on 3/18/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

func ord(c: Character) -> UInt8 {
    return [UInt8](String(c).utf8)[0]
}

func chr(b: UInt8) -> Character {
    let bs = [b]
    let s = NSString(bytes: bs, length: bs.count, encoding: NSUTF8StringEncoding) as String
    return Array(s)[0]
}

