//
//  main.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/17.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation

class Solution {
    let dictStr = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var seq     = 0
    var urlMapL2S: [String: String] = [:]
    var urlMapS2L: [String: String] = [:]
    //短地址长度
    let shortLength = 6
    
    //原理就是对longUrl进行映射
    func encode(_ longUrl: String) -> String {
        if let s = urlMapL2S[longUrl] {
            return s
        }
        
        var res = ""
        var count = seq
        seq += 1
        while count != 0 {
            res = String(dictStr[dictStr.index(dictStr.startIndex, offsetBy: count % dictStr.count)]) + res
            count /= dictStr.count
        }
        let start = res.count
        for _ in  start ..< shortLength {
            res = "0" + res
        }
        
        urlMapL2S[longUrl] = res
        urlMapS2L[res] = longUrl
        
        return res
    }
    
    func decode(_ shortUrl: String) -> String {
        return urlMapS2L[shortUrl]!
    }
}

let s = Solution()
for index in 0 ..< 100 {
    print(s.encode("www.google.com\(index)"))
}
print(s.decode(s.encode("www.google.com")))
