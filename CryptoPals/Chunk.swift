//
//  Chunk.swift
//  CryptoPals
//
//  Created by Nate West on 3/17/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

class Chunk<T> : SequenceType {
    let elements : [T]
    let size : Int
    typealias Generator = ChunkGenerator<T>

    init(ts: [T], size: Int) {
        elements = ts
        self.size = size
    }

    func generate() -> ChunkGenerator<T> {
        return ChunkGenerator(ts: elements, size: size)
    }

}

class ChunkGenerator<T> : GeneratorType {
    let collection : [T]
    let size : Int
    var offset : Int = 0
    var end : Int = 0

    typealias Element = Slice<T>

    init(ts: [T], size: Int) {
        collection = ts
        self.size = size
    }

    func next() -> Slice<T>? {

        if (reachedTheEnd()) {
            return .None
        }

        updateEnd()
        let chunk = collection[offset..<end]
        updateOffset()
        return chunk
    }

    func reachedTheEnd() -> Bool {
        return offset >= collection.count
    }

    func updateOffset() {
        offset += size
    }

    func updateEnd() {
        end = offset + size
        if (end > collection.count) {
            end = collection.count
        }
    }
}

