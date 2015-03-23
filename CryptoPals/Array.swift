//
//  Array.swift
//  CryptoPals
//
//  Created by Nate West on 3/17/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

extension Array {
    func by(size: Int) -> Chunk<T> {
        return Chunk(ts: self, size: size)
    }
}

func single_char_xor(bs:[UInt8], c:UInt8) -> [UInt8] {
    var cs: [UInt8] = []
    for _ in bs {
        cs.append(c)
    }

    return xor(bs, cs)
}

func multi_char_xor(bs:[UInt8], cs:[UInt8]) -> [UInt8] {
    var longcs: [UInt8] = []
    let keyLength = cs.count
    var keyOffset = 0

    while longcs.count < bs.count {
        longcs.append(cs[keyOffset])

        keyOffset++
        if (keyOffset > keyLength - 1) {
            keyOffset = 0
        }
    }

    return xor(bs, longcs)
}

func xor(left: [UInt8], right: [UInt8]) -> [UInt8] {
    return zipWith(left, right, ^)
}

func zipWith<A, B, C>(lhs: [A], rhs: [B], combine: (A, B) -> C) -> [C] {
    return map(Zip2(lhs, rhs), combine)
}

func englishString(bs:[UInt8]) -> String {
    return reduce(map(bs, chr), "", appendCharacter)
}

func hammingDistance(b1s: [UInt8], b2s: [UInt8]) -> Float {
    let test = zipWith(base2(b1s), base2(b2s), ==)
    return Float(filter(test, {$0 == false}).count)
}

func bytesAtIndex(bs: [[UInt8]], i:Int) -> [UInt8] {

    var newChunk: [UInt8] = []
    for chunk in bs {
        if (chunk.count > i) {
            newChunk.append(chunk[i])
        }
    }

    return newChunk
}
