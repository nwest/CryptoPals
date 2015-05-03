//
//  AES.swift
//  CryptoPals
//
//  Created by Nate West on 3/22/15.
//  Copyright (c) 2015 Nate West. All rights reserved.
//

import Foundation
import CryptoSwift

func AES_ECB_128_decrypt(key: [UInt8], bs: [UInt8]) -> String {

    if let aes = AES(key: key, blockMode: .ECB) {
        if let decrypted = aes.decrypt(bs, padding: .None) {
            return englishString(decrypted)
        }
    }

    return ""
}
