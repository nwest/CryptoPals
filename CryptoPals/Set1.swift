//
//  Set1.swift
//  CryptoPals
//
//  Created by Nate West on 3/22/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation

func set1() {
//    problem1()
//    problem2()
//    problem3()
//    problem4()
//    problem5()
//    problem6()
    problem7()
//    problem8()
}

func problem1() {
    let input1 = hexToRaw("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")
    let output1 = base64Encode(input1)
    println("\(output1)")
}

func problem2() {
    let left = hexToRaw("1c0111001f010100061a024b53535009181c")
    let right = hexToRaw("686974207468652062756c6c277320657965")
    let output2 = rawToHex(xor(left, right))
    println("\(output2)")
}

func problem3() {
    let input3 = hexToRaw("1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736")
    let (key, score, raw) = best_single_char_xor(input3)
    let solution3 = reduce(map(raw, chr), "", appendCharacter)
    println("\(solution3)")
}

func problem4() {
    let inputs = input4()
    let bestPossible = map(inputs, best_single_char_xor)
    let sortedInputs = sorted(bestPossible) { $0.1 > $1.1 }
    let (key, score, raw) = sortedInputs[0]
    println("Key: \(chr(key)) Output: \(englishString(raw))")
}

func problem5() {
    let input = "Burning 'em, if you ain't quick and nimble\nI go crazy when I hear a cymbal".ord()
    let key = "ICE".ord()
    let output = multi_char_xor(input, key)
    println("\(rawToHex(output))")
}

func problem6() {
    let input = base64Decode(input6())
    let possibleKeySizes = Array(2...40)
    let keyScores: [Float] = possibleKeySizes.map({
        let numChunks = 12
        let chunks = Array(input.by($0))[0..<numChunks]

        var chunkScores: [Float] = []
        for var i = 0; i < chunks.count - 2; i++ {
            let this: [UInt8] = Array(chunks[i])
            let next: [UInt8] = Array(chunks[i + 1])
            let score: Float = (hammingDistance(this, next) / Float($0))
            chunkScores.append(score)
        }

        return chunkScores.reduce(0.0, combine: +) / Float(numChunks)
    })
    let scoredKeySizes = sorted(Zip2(possibleKeySizes, keyScores)) { $0.1 < $1.1 }
    let (keySize, score) = scoredKeySizes.first!
    println("key size: \(keySize)")

    var chopped: [[UInt8]] = []
    let chunks: [[UInt8]] = Array(input.by(keySize)).map({ Array($0) })

    for offset in 0..<keySize {
        chopped.append(bytesAtIndex(chunks, offset))
    }

    let solved = map(chopped, best_single_char_xor)

    let key = map(solved, {$0.0})
    let plainKey = englishString(key)
    println("key: \(plainKey)")
    let solution = englishString(multi_char_xor(input, key))
    println("\(solution)")
}

func problem7() {
    let input = base64Decode(input7())
    let key = "YELLOW SUBMARINE".ord()
    let decrypted = AES_ECB_128_decrypt(key, input)
    println("\(decrypted)")
}

func problem8() {

}
