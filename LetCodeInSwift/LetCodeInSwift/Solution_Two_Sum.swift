//
//  Solution_Two_Sum.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/20.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation



/*
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

//这种写法超时了.......
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0...nums.count - 1 {
            if nums.contains(target - nums[i]) {
                for j in i+1...nums.count - 1 {
                    if nums[i] + nums[j] == target {
                        return [i, j]
                    }
                }
            }
        }
        return [0, 0]
    }
}

//class Solution {
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        for i in 0...nums.count - 1 {
//            for j in i+1...nums.count - 1 {
//                if nums[i] + nums[j] == target {
//                    return [i, j]
//                }
//            }
//        }
//        return [0, 0]
//    }
//}
