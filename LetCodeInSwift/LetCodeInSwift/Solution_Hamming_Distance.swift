//
//  Solution_Hamming_Distance.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/17.
//  Copyright © 2017年 Cocos. All rights reserved.
//
import Foundation

class Solution_Hamming_Distance {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var num = x ^ y
        var count = 0
        for _ in 0 ... UInt32.max {
            if num != 0 {
                count += 1
            }else {
                break
            }
            num &= (num - 1)
        }
        return count
    }
}
