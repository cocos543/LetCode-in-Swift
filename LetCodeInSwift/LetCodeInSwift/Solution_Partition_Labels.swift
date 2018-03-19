//
//  Solution_Partition_Labels.swift
//  LetCodeInSwift
//
//  Created by Cocos on 2018/3/19.
//  Copyright © 2018年 Cocos. All rights reserved.
//

import Foundation

class Solution_Partition_Labels {
    func partitionLabels(_ S: String) -> [Int] {
        //题意是把数组分割成多个部分之后,确保每一个字符都最多出现在一个部分里,而且分割之后的字串数量要求是最多的.
        //本题使用贪心算法, 先确保第一个字符符合条件:先从第一个字符开始,查找第一个字符最后出现的位置作为第一部分的分割点.
        //再依次让下一个字符符合条件,直到所有字符都符合条件
        var parts = [Int]()
        
        //Swift中无法直接用下标获取对应位置的字符,为了方便起见,先把字符串转成一个数组再来操作
        var s = Array(S)
        //用于记录检索的位置.
        var searchIndex = 0
        //true,表示需要寻找下一个part了
        var nextPart = true
        
        while searchIndex < s.count {
            if let lastIndex = parts.last, searchIndex > lastIndex {
                nextPart = true
            }
            
            let c = s[searchIndex]
            for i in stride(from: s.count - 1, through: 0, by: -1) {
                //下一个字符匹配到最后一个part的末尾就可以了,无须继续往左边对比,因为lastIndex往左已经是最后一个part内部了
                if let lastIndex = parts.last, i <= lastIndex {
                    break
                }
                if c == s[i] {
                    if nextPart == true {
                        parts.append(i)
                        nextPart = false
                    }else {
                        //update last one
                        parts.removeLast()
                        parts.append(i)
                    }
                    break
                }
            }
            searchIndex = searchIndex + 1
        }
        
        //这里parts里面的元素就表示S字符串需要分割成的字串的位置,分别是0-S[0], S[0]+1 - S[1], ... , S[n-1]-1 - S[n]
        //题目需要返回的是每一个字串的长度,所以需要调整一下数组再返回.
        var local = parts[0]
        var res = [Int]()
        for e in parts {
            if e == local {
                res.append(e + 1)
            }else {
                res.append(e - local)
            }
            local = e
        }
        
        return res
    }
}

//let s = Solution()
//print(s.partitionLabels("adadsfzxcxzcvvpoiulopiukj"))
//ababcbacadefegdehijhklij
