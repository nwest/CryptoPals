//
//  EnglishScore.swift
//  CryptoPals
//
//  Created by Nate West on 3/20/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

private let _sharedInstance = English()

class English {

    class var sharedInstance: English {
        return _sharedInstance;
    }

    let keys: [UInt8:Float]

    init() {
        let rawKeys: [(Character, Float)] = [
            ("e", 14.7),
            ("t", 9.0),
            ("a", 8.16),
            ("o", 7.5),
            ("i", 6.9),
            ("n", 6.75),
            ("s", 6.32),
            ("h", 6.0),
            ("r", 5.98),
            ("d", 4.25),
            ("l", 4.025),
            ("c", 2.78),
            ("u", 2.75),
            ("m", 2.40),
            (" ", 0.0),
            (",", 0.0),
            ("'", 0.0),
            (".", 0.0),
        ]

        keys = raw(rawKeys)
    }

    func score(bs: [UInt8]) -> Float {
        return reduce(map(bs, score), 0.0, +)
    }

    private func score(b: UInt8) -> Float {
        if let score = keys[b] {
            return score
        }
        else {
            return -10.0
        }
    }
}

func raw(cs: [(Character, Float)]) -> [UInt8:Float] {
    let foo : [(UInt8, Float)] = map(cs, { (ord($0.0), $0.1) })
    return Dictionary(foo)
}

func best_single_char_xor(bs: [UInt8]) -> (UInt8, Float, [UInt8]) {
    let possibleKeys = map(Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-= :"), ord)
    let xord : [[UInt8]] = map(possibleKeys) { single_char_xor(bs, $0) }
    let scores: [Float] = map(xord) { English().score($0) }
    let allThree: [(UInt8, Float, [UInt8])] = Zip3(possibleKeys, scores, xord)
    let sortedScores: [(UInt8, Float, [UInt8])] = sorted(allThree) { $0.1 > $1.1 }
    return sortedScores.first!
}
