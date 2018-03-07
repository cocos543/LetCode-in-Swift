//
//  main.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2017/7/17.
//  Copyright © 2017年 Cocos. All rights reserved.
//

import Foundation

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        //创建一个字典, 把石头宝石的类型作为key
        var allStoneDic: [Character : Int] = [Character : Int]()
        //得到S字符串中各种类型的石头宝石的数量
        for c in S {
            if let num = allStoneDic[c] {
                allStoneDic[c] = num + 1
            }else {
                allStoneDic[c] = 1
            }
        }
        //使用J里面所有宝石类型作为key,去访问字典
        var jewelsAmount = 0
        for c in J {
            if let num = allStoneDic[c] {
                jewelsAmount += num
            }
        }
        //得到对应宝石的数量
        return jewelsAmount
    }
}
var s = Solution()
print(s.numJewelsInStones("", "abbcccdddd"))


