//
//  Solution_Array_Partition_I.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/17.
//  Copyright © 2017年 Cocos. All rights reserved.
//
import Foundation

class Solution_Array_Partition_I {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var sum = 0
        let sortedNums = nums.sorted(by: {a,b in return a < b})
        for (index, value) in sortedNums.enumerated() {
            if index % 2 == 0 {
                sum += value
            }
        }
        return sum
    }
}
